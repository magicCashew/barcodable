#![allow(unused_extern_crates)]
extern crate tokio_core;
extern crate native_tls;
extern crate hyper_tls;
extern crate openssl;
extern crate mime;
extern crate chrono;
extern crate url;

use hyper;
use hyper::header::{Headers, ContentType};
use hyper::Uri;
use self::url::percent_encoding::{utf8_percent_encode, PATH_SEGMENT_ENCODE_SET, QUERY_ENCODE_SET};
use futures;
use futures::{Future, Stream};
use futures::{future, stream};
use self::tokio_core::reactor::Handle;
use std::borrow::Cow;
use std::io::{Read, Error, ErrorKind};
use std::error;
use std::fmt;
use std::path::Path;
use std::sync::Arc;
use std::str;
use std::str::FromStr;
use std::string::ToString;
use swagger::headers::SafeHeaders;

use mimetypes;
use serde_json;

#[allow(unused_imports)]
use std::collections::{HashMap, BTreeMap};
#[allow(unused_imports)]
use swagger;

use swagger::{ApiError, XSpanId, XSpanIdString, Has, AuthData};

use {Api,
     ConvertCodeResponse,
     GetItemByASINResponse,
     GetItemByEANResponse,
     GetItemByUPCResponse
     };
use models;

define_encode_set! {
    /// This encode set is used for object IDs
    ///
    /// Aside from the special characters defined in the `PATH_SEGMENT_ENCODE_SET`,
    /// the vertical bar (|) is encoded.
    pub ID_ENCODE_SET = [PATH_SEGMENT_ENCODE_SET] | {'|'}
}

/// Convert input into a base path, e.g. "http://example:123". Also checks the scheme as it goes.
fn into_base_path(input: &str, correct_scheme: Option<&'static str>) -> Result<String, ClientInitError> {
    // First convert to Uri, since a base path is a subset of Uri.
    let uri = Uri::from_str(input)?;

    let scheme = uri.scheme().ok_or(ClientInitError::InvalidScheme)?;

    // Check the scheme if necessary
    if let Some(correct_scheme) = correct_scheme {
        if scheme != correct_scheme {
            return Err(ClientInitError::InvalidScheme);
        }
    }

    let host = uri.host().ok_or_else(|| ClientInitError::MissingHost)?;
    let port = uri.port().map(|x| format!(":{}", x)).unwrap_or_default();
    Ok(format!("{}://{}{}", scheme, host, port))
}

/// A client that implements the API by making HTTP calls out to a server.
pub struct Client<F> where
  F: Future<Item=hyper::Response, Error=hyper::Error> + 'static {
    client_service: Arc<Box<dyn hyper::client::Service<Request=hyper::Request<hyper::Body>, Response=hyper::Response, Error=hyper::Error, Future=F>>>,
    base_path: String,
}

impl<F> fmt::Debug for Client<F> where
   F: Future<Item=hyper::Response, Error=hyper::Error>  + 'static {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        write!(f, "Client {{ base_path: {} }}", self.base_path)
    }
}

impl<F> Clone for Client<F> where
   F: Future<Item=hyper::Response, Error=hyper::Error>  + 'static {
    fn clone(&self) -> Self {
        Client {
            client_service: self.client_service.clone(),
            base_path: self.base_path.clone()
        }
    }
}

impl Client<hyper::client::FutureResponse> {

    /// Create an HTTP client.
    ///
    /// # Arguments
    /// * `handle` - tokio reactor handle to use for execution
    /// * `base_path` - base path of the client API, i.e. "www.my-api-implementation.com"
    pub fn try_new_http(handle: Handle, base_path: &str) -> Result<Client<hyper::client::FutureResponse>, ClientInitError> {
        let http_connector = swagger::http_connector();
        Self::try_new_with_connector::<hyper::client::HttpConnector>(
            handle,
            base_path,
            Some("http"),
            http_connector,
        )
    }

    /// Create a client with a TLS connection to the server.
    ///
    /// # Arguments
    /// * `handle` - tokio reactor handle to use for execution
    /// * `base_path` - base path of the client API, i.e. "www.my-api-implementation.com"
    /// * `ca_certificate` - Path to CA certificate used to authenticate the server
    pub fn try_new_https<CA>(
        handle: Handle,
        base_path: &str,
        ca_certificate: CA,
    ) -> Result<Client<hyper::client::FutureResponse>, ClientInitError>
    where
        CA: AsRef<Path>,
    {
        let https_connector = swagger::https_connector(ca_certificate);
        Self::try_new_with_connector::<hyper_tls::HttpsConnector<hyper::client::HttpConnector>>(
            handle,
            base_path,
            Some("https"),
            https_connector,
        )
    }

    /// Create a client with a mutually authenticated TLS connection to the server.
    ///
    /// # Arguments
    /// * `handle` - tokio reactor handle to use for execution
    /// * `base_path` - base path of the client API, i.e. "www.my-api-implementation.com"
    /// * `ca_certificate` - Path to CA certificate used to authenticate the server
    /// * `client_key` - Path to the client private key
    /// * `client_certificate` - Path to the client's public certificate associated with the private key
    pub fn try_new_https_mutual<CA, K, C>(
        handle: Handle,
        base_path: &str,
        ca_certificate: CA,
        client_key: K,
        client_certificate: C,
    ) -> Result<Client<hyper::client::FutureResponse>, ClientInitError>
    where
        CA: AsRef<Path>,
        K: AsRef<Path>,
        C: AsRef<Path>,
    {
        let https_connector =
            swagger::https_mutual_connector(ca_certificate, client_key, client_certificate);
        Self::try_new_with_connector::<hyper_tls::HttpsConnector<hyper::client::HttpConnector>>(
            handle,
            base_path,
            Some("https"),
            https_connector,
        )
    }

    /// Create a client with a custom implementation of hyper::client::Connect.
    ///
    /// Intended for use with custom implementations of connect for e.g. protocol logging
    /// or similar functionality which requires wrapping the transport layer. When wrapping a TCP connection,
    /// this function should be used in conjunction with
    /// `swagger::{http_connector, https_connector, https_mutual_connector}`.
    ///
    /// For ordinary tcp connections, prefer the use of `try_new_http`, `try_new_https`
    /// and `try_new_https_mutual`, to avoid introducing a dependency on the underlying transport layer.
    ///
    /// # Arguments
    ///
    /// * `handle` - tokio reactor handle to use for execution
    /// * `base_path` - base path of the client API, i.e. "www.my-api-implementation.com"
    /// * `protocol` - Which protocol to use when constructing the request url, e.g. `Some("http")`
    /// * `connector_fn` - Function which returns an implementation of `hyper::client::Connect`
    pub fn try_new_with_connector<C>(
        handle: Handle,
        base_path: &str,
        protocol: Option<&'static str>,
        connector_fn: Box<dyn Fn(&Handle) -> C + Send + Sync>,
    ) -> Result<Client<hyper::client::FutureResponse>, ClientInitError>
    where
        C: hyper::client::Connect + hyper::client::Service,
    {
        let connector = connector_fn(&handle);
        let client_service = Box::new(hyper::Client::configure().connector(connector).build(
            &handle,
        ));

        Ok(Client {
            client_service: Arc::new(client_service),
            base_path: into_base_path(base_path, protocol)?,
        })
    }

    /// Constructor for creating a `Client` by passing in a pre-made `hyper` client.
    ///
    /// One should avoid relying on this function if possible, since it adds a dependency on the underlying transport
    /// implementation, which it would be better to abstract away. Therefore, using this function may lead to a loss of
    /// code generality, which may make it harder to move the application to a serverless environment, for example.
    ///
    /// The reason for this function's existence is to support legacy test code, which did mocking at the hyper layer.
    /// This is not a recommended way to write new tests. If other reasons are found for using this function, they
    /// should be mentioned here.
    #[deprecated(note="Use try_new_with_client_service instead")]
    pub fn try_new_with_hyper_client(
        hyper_client: Arc<Box<dyn hyper::client::Service<Request=hyper::Request<hyper::Body>, Response=hyper::Response, Error=hyper::Error, Future=hyper::client::FutureResponse>>>,
        handle: Handle,
        base_path: &str
    ) -> Result<Client<hyper::client::FutureResponse>, ClientInitError>
    {
        Ok(Client {
            client_service: hyper_client,
            base_path: into_base_path(base_path, None)?,
        })
    }
}

impl<F> Client<F> where
    F: Future<Item=hyper::Response, Error=hyper::Error>  + 'static
{
    /// Constructor for creating a `Client` by passing in a pre-made `hyper` client Service.
    ///
    /// This allows adding custom wrappers around the underlying transport, for example for logging.
    pub fn try_new_with_client_service(client_service: Arc<Box<dyn hyper::client::Service<Request=hyper::Request<hyper::Body>, Response=hyper::Response, Error=hyper::Error, Future=F>>>,
                                       handle: Handle,
                                       base_path: &str)
                                    -> Result<Client<F>, ClientInitError>
    {
        Ok(Client {
            client_service: client_service,
            base_path: into_base_path(base_path, None)?,
        })
    }
}

impl<F, C> Api<C> for Client<F> where
    F: Future<Item=hyper::Response, Error=hyper::Error>  + 'static,
    C: Has<XSpanIdString> + Has<Option<AuthData>>{

    fn convert_code(&self, param_upc___ean___asin: String, context: &C) -> Box<dyn Future<Item=ConvertCodeResponse, Error=ApiError>> {
        let mut uri = format!(
            "{}/magicCashew/barcodable/1.0.0/api/v1/convert/{upc___ean___asin}",
            self.base_path, upc___ean___asin=utf8_percent_encode(&param_upc___ean___asin.to_string(), ID_ENCODE_SET)
        );

        let mut query_string = self::url::form_urlencoded::Serializer::new("".to_owned());


        let query_string_str = query_string.finish();
        if !query_string_str.is_empty() {
            uri += "?";
            uri += &query_string_str;
        }

        let uri = match Uri::from_str(&uri) {
            Ok(uri) => uri,
            Err(err) => return Box::new(futures::done(Err(ApiError(format!("Unable to build URI: {}", err))))),
        };

        let mut request = hyper::Request::new(hyper::Method::Get, uri);


        request.headers_mut().set(XSpanId((context as &dyn Has<XSpanIdString>).get().0.clone()));
        Box::new(self.client_service.call(request)
                             .map_err(|e| ApiError(format!("No response received: {}", e)))
                             .and_then(|mut response| {
            match response.status().as_u16() {
                200 => {
                    header! { (ResponseXValidAuthorization, "X-ValidAuthorization") => [bool] }
                    let response_x_valid_authorization = match response.headers().safe_get::<ResponseXValidAuthorization>() {
                        Some(response_x_valid_authorization) => response_x_valid_authorization.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-ValidAuthorization for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitLimit, "X-RateLimit-Limit") => [i32] }
                    let response_x_rate_limit_limit = match response.headers().safe_get::<ResponseXRateLimitLimit>() {
                        Some(response_x_rate_limit_limit) => response_x_rate_limit_limit.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Limit for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitRemaining, "X-RateLimit-Remaining") => [i32] }
                    let response_x_rate_limit_remaining = match response.headers().safe_get::<ResponseXRateLimitRemaining>() {
                        Some(response_x_rate_limit_remaining) => response_x_rate_limit_remaining.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Remaining for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitReset, "X-RateLimit-Reset") => [chrono::DateTime<chrono::Utc>] }
                    let response_x_rate_limit_reset = match response.headers().safe_get::<ResponseXRateLimitReset>() {
                        Some(response_x_rate_limit_reset) => response_x_rate_limit_reset.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Reset for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::InlineResponse200>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            ConvertCodeResponse::SuccessfulOperation{ body: body, x_valid_authorization: response_x_valid_authorization, x_rate_limit_limit: response_x_rate_limit_limit, x_rate_limit_remaining: response_x_rate_limit_remaining, x_rate_limit_reset: response_x_rate_limit_reset }
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                400 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::InlineResponse400>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            ConvertCodeResponse::SearchResultsMatchingCriteria(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                code => {
                    let headers = response.headers().clone();
                    Box::new(response.body()
                            .take(100)
                            .concat2()
                            .then(move |body|
                                future::err(ApiError(format!("Unexpected response code {}:\n{:?}\n\n{}",
                                    code,
                                    headers,
                                    match body {
                                        Ok(ref body) => match str::from_utf8(body) {
                                            Ok(body) => Cow::from(body),
                                            Err(e) => Cow::from(format!("<Body was not UTF8: {:?}>", e)),
                                        },
                                        Err(e) => Cow::from(format!("<Failed to read body: {}>", e)),
                                    })))
                            )
                    ) as Box<dyn Future<Item=_, Error=_>>
                }
            }
        }))

    }

    fn get_item_by_asin(&self, param_asin: String, context: &C) -> Box<dyn Future<Item=GetItemByASINResponse, Error=ApiError>> {
        let mut uri = format!(
            "{}/magicCashew/barcodable/1.0.0/api/v1/asin/{asin}",
            self.base_path, asin=utf8_percent_encode(&param_asin.to_string(), ID_ENCODE_SET)
        );

        let mut query_string = self::url::form_urlencoded::Serializer::new("".to_owned());


        let query_string_str = query_string.finish();
        if !query_string_str.is_empty() {
            uri += "?";
            uri += &query_string_str;
        }

        let uri = match Uri::from_str(&uri) {
            Ok(uri) => uri,
            Err(err) => return Box::new(futures::done(Err(ApiError(format!("Unable to build URI: {}", err))))),
        };

        let mut request = hyper::Request::new(hyper::Method::Get, uri);


        request.headers_mut().set(XSpanId((context as &dyn Has<XSpanIdString>).get().0.clone()));
        Box::new(self.client_service.call(request)
                             .map_err(|e| ApiError(format!("No response received: {}", e)))
                             .and_then(|mut response| {
            match response.status().as_u16() {
                200 => {
                    header! { (ResponseXValidAuthorization, "X-ValidAuthorization") => [bool] }
                    let response_x_valid_authorization = match response.headers().safe_get::<ResponseXValidAuthorization>() {
                        Some(response_x_valid_authorization) => response_x_valid_authorization.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-ValidAuthorization for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitLimit, "X-RateLimit-Limit") => [i32] }
                    let response_x_rate_limit_limit = match response.headers().safe_get::<ResponseXRateLimitLimit>() {
                        Some(response_x_rate_limit_limit) => response_x_rate_limit_limit.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Limit for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitRemaining, "X-RateLimit-Remaining") => [i32] }
                    let response_x_rate_limit_remaining = match response.headers().safe_get::<ResponseXRateLimitRemaining>() {
                        Some(response_x_rate_limit_remaining) => response_x_rate_limit_remaining.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Remaining for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitReset, "X-RateLimit-Reset") => [chrono::DateTime<chrono::Utc>] }
                    let response_x_rate_limit_reset = match response.headers().safe_get::<ResponseXRateLimitReset>() {
                        Some(response_x_rate_limit_reset) => response_x_rate_limit_reset.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Reset for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::Item>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByASINResponse::SuccessfulOperation{ body: body, x_valid_authorization: response_x_valid_authorization, x_rate_limit_limit: response_x_rate_limit_limit, x_rate_limit_remaining: response_x_rate_limit_remaining, x_rate_limit_reset: response_x_rate_limit_reset }
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                400 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::InvalidCode>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByASINResponse::SearchResultsMatchingCriteria(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                404 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::NotFound>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByASINResponse::SearchResultsMatchingCriteria_2(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                code => {
                    let headers = response.headers().clone();
                    Box::new(response.body()
                            .take(100)
                            .concat2()
                            .then(move |body|
                                future::err(ApiError(format!("Unexpected response code {}:\n{:?}\n\n{}",
                                    code,
                                    headers,
                                    match body {
                                        Ok(ref body) => match str::from_utf8(body) {
                                            Ok(body) => Cow::from(body),
                                            Err(e) => Cow::from(format!("<Body was not UTF8: {:?}>", e)),
                                        },
                                        Err(e) => Cow::from(format!("<Failed to read body: {}>", e)),
                                    })))
                            )
                    ) as Box<dyn Future<Item=_, Error=_>>
                }
            }
        }))

    }

    fn get_item_by_ean(&self, param_ean: String, context: &C) -> Box<dyn Future<Item=GetItemByEANResponse, Error=ApiError>> {
        let mut uri = format!(
            "{}/magicCashew/barcodable/1.0.0/api/v1/ean/{ean}",
            self.base_path, ean=utf8_percent_encode(&param_ean.to_string(), ID_ENCODE_SET)
        );

        let mut query_string = self::url::form_urlencoded::Serializer::new("".to_owned());


        let query_string_str = query_string.finish();
        if !query_string_str.is_empty() {
            uri += "?";
            uri += &query_string_str;
        }

        let uri = match Uri::from_str(&uri) {
            Ok(uri) => uri,
            Err(err) => return Box::new(futures::done(Err(ApiError(format!("Unable to build URI: {}", err))))),
        };

        let mut request = hyper::Request::new(hyper::Method::Get, uri);


        request.headers_mut().set(XSpanId((context as &dyn Has<XSpanIdString>).get().0.clone()));
        Box::new(self.client_service.call(request)
                             .map_err(|e| ApiError(format!("No response received: {}", e)))
                             .and_then(|mut response| {
            match response.status().as_u16() {
                200 => {
                    header! { (ResponseXValidAuthorization, "X-ValidAuthorization") => [bool] }
                    let response_x_valid_authorization = match response.headers().safe_get::<ResponseXValidAuthorization>() {
                        Some(response_x_valid_authorization) => response_x_valid_authorization.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-ValidAuthorization for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitLimit, "X-RateLimit-Limit") => [i32] }
                    let response_x_rate_limit_limit = match response.headers().safe_get::<ResponseXRateLimitLimit>() {
                        Some(response_x_rate_limit_limit) => response_x_rate_limit_limit.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Limit for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitRemaining, "X-RateLimit-Remaining") => [i32] }
                    let response_x_rate_limit_remaining = match response.headers().safe_get::<ResponseXRateLimitRemaining>() {
                        Some(response_x_rate_limit_remaining) => response_x_rate_limit_remaining.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Remaining for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitReset, "X-RateLimit-Reset") => [chrono::DateTime<chrono::Utc>] }
                    let response_x_rate_limit_reset = match response.headers().safe_get::<ResponseXRateLimitReset>() {
                        Some(response_x_rate_limit_reset) => response_x_rate_limit_reset.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Reset for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::Item>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByEANResponse::SuccessfulOperation{ body: body, x_valid_authorization: response_x_valid_authorization, x_rate_limit_limit: response_x_rate_limit_limit, x_rate_limit_remaining: response_x_rate_limit_remaining, x_rate_limit_reset: response_x_rate_limit_reset }
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                400 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::InvalidCode>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByEANResponse::SearchResultsMatchingCriteria(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                404 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::NotFound>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByEANResponse::SearchResultsMatchingCriteria_2(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                code => {
                    let headers = response.headers().clone();
                    Box::new(response.body()
                            .take(100)
                            .concat2()
                            .then(move |body|
                                future::err(ApiError(format!("Unexpected response code {}:\n{:?}\n\n{}",
                                    code,
                                    headers,
                                    match body {
                                        Ok(ref body) => match str::from_utf8(body) {
                                            Ok(body) => Cow::from(body),
                                            Err(e) => Cow::from(format!("<Body was not UTF8: {:?}>", e)),
                                        },
                                        Err(e) => Cow::from(format!("<Failed to read body: {}>", e)),
                                    })))
                            )
                    ) as Box<dyn Future<Item=_, Error=_>>
                }
            }
        }))

    }

    fn get_item_by_upc(&self, param_upc: String, context: &C) -> Box<dyn Future<Item=GetItemByUPCResponse, Error=ApiError>> {
        let mut uri = format!(
            "{}/magicCashew/barcodable/1.0.0/api/v1/upc/{upc}",
            self.base_path, upc=utf8_percent_encode(&param_upc.to_string(), ID_ENCODE_SET)
        );

        let mut query_string = self::url::form_urlencoded::Serializer::new("".to_owned());


        let query_string_str = query_string.finish();
        if !query_string_str.is_empty() {
            uri += "?";
            uri += &query_string_str;
        }

        let uri = match Uri::from_str(&uri) {
            Ok(uri) => uri,
            Err(err) => return Box::new(futures::done(Err(ApiError(format!("Unable to build URI: {}", err))))),
        };

        let mut request = hyper::Request::new(hyper::Method::Get, uri);


        request.headers_mut().set(XSpanId((context as &dyn Has<XSpanIdString>).get().0.clone()));
        Box::new(self.client_service.call(request)
                             .map_err(|e| ApiError(format!("No response received: {}", e)))
                             .and_then(|mut response| {
            match response.status().as_u16() {
                200 => {
                    header! { (ResponseXValidAuthorization, "X-ValidAuthorization") => [bool] }
                    let response_x_valid_authorization = match response.headers().safe_get::<ResponseXValidAuthorization>() {
                        Some(response_x_valid_authorization) => response_x_valid_authorization.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-ValidAuthorization for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitLimit, "X-RateLimit-Limit") => [i32] }
                    let response_x_rate_limit_limit = match response.headers().safe_get::<ResponseXRateLimitLimit>() {
                        Some(response_x_rate_limit_limit) => response_x_rate_limit_limit.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Limit for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitRemaining, "X-RateLimit-Remaining") => [i32] }
                    let response_x_rate_limit_remaining = match response.headers().safe_get::<ResponseXRateLimitRemaining>() {
                        Some(response_x_rate_limit_remaining) => response_x_rate_limit_remaining.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Remaining for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    header! { (ResponseXRateLimitReset, "X-RateLimit-Reset") => [chrono::DateTime<chrono::Utc>] }
                    let response_x_rate_limit_reset = match response.headers().safe_get::<ResponseXRateLimitReset>() {
                        Some(response_x_rate_limit_reset) => response_x_rate_limit_reset.0.clone(),
                        None => return Box::new(future::err(ApiError(String::from("Required response header X-RateLimit-Reset for response 200 was not found.")))) as Box<dyn Future<Item=_, Error=_>>,
                    };
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::Item>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByUPCResponse::SuccessfulOperation{ body: body, x_valid_authorization: response_x_valid_authorization, x_rate_limit_limit: response_x_rate_limit_limit, x_rate_limit_remaining: response_x_rate_limit_remaining, x_rate_limit_reset: response_x_rate_limit_reset }
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                400 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::InvalidCode>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByUPCResponse::SearchResultsMatchingCriteria(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                404 => {
                    let body = response.body();
                    Box::new(
                        body
                        .concat2()
                        .map_err(|e| ApiError(format!("Failed to read response: {}", e)))
                        .and_then(|body|
                            str::from_utf8(&body)
                            .map_err(|e| ApiError(format!("Response was not valid UTF8: {}", e)))
                            .and_then(|body|
                                serde_json::from_str::<models::NotFound>(body)
                                .map_err(|e| e.into())
                            )
                        )
                        .map(move |body| {
                            GetItemByUPCResponse::SearchResultsMatchingCriteria_2(body)
                        })
                    ) as Box<dyn Future<Item=_, Error=_>>
                },
                code => {
                    let headers = response.headers().clone();
                    Box::new(response.body()
                            .take(100)
                            .concat2()
                            .then(move |body|
                                future::err(ApiError(format!("Unexpected response code {}:\n{:?}\n\n{}",
                                    code,
                                    headers,
                                    match body {
                                        Ok(ref body) => match str::from_utf8(body) {
                                            Ok(body) => Cow::from(body),
                                            Err(e) => Cow::from(format!("<Body was not UTF8: {:?}>", e)),
                                        },
                                        Err(e) => Cow::from(format!("<Failed to read body: {}>", e)),
                                    })))
                            )
                    ) as Box<dyn Future<Item=_, Error=_>>
                }
            }
        }))

    }

}

#[derive(Debug)]
pub enum ClientInitError {
    InvalidScheme,
    InvalidUri(hyper::error::UriError),
    MissingHost,
    SslError(openssl::error::ErrorStack)
}

impl From<hyper::error::UriError> for ClientInitError {
    fn from(err: hyper::error::UriError) -> ClientInitError {
        ClientInitError::InvalidUri(err)
    }
}

impl From<openssl::error::ErrorStack> for ClientInitError {
    fn from(err: openssl::error::ErrorStack) -> ClientInitError {
        ClientInitError::SslError(err)
    }
}

impl fmt::Display for ClientInitError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
        (self as &dyn fmt::Debug).fmt(f)
    }
}

impl error::Error for ClientInitError {
    fn description(&self) -> &str {
        "Failed to produce a hyper client."
    }
}
