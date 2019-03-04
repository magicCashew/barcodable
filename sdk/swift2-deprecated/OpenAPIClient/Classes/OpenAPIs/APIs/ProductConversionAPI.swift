//
// ProductConversionAPI.swift
//
// Generated by openapi-generator
// https://openapi-generator.tech
//

import Alamofire



public class ProductConversionAPI: APIBase {
    /**
     Convert between UPC, EAN, and ASIN product codes.
     
     - parameter upcEanAsin: (path) UPC, EAN, or ASIN 
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func convertCode(upcEanAsin upcEanAsin: String, completion: ((data: InlineResponse200?, error: ErrorType?) -> Void)) {
        convertCodeWithRequestBuilder(upcEanAsin: upcEanAsin).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     Convert between UPC, EAN, and ASIN product codes.
     - GET /api/v1/convert/{upc | ean | asin}
     - Returns the converted UPC, EAN, and ASIN codes.     - responseHeaders: [X-ValidAuthorization(Bool), X-RateLimit-Limit(Int32), X-RateLimit-Remaining(Int32), X-RateLimit-Reset(NSDate)]
     - examples: [{contentType=application/json, example={
  "asins" : [ "B01M1EXQY4" ],
  "message" : "OK",
  "upcs" : [ "190198155795" ],
  "eans" : [ 1.90198155795E11 ]
}, statusCode=200}]
     - parameter upcEanAsin: (path) UPC, EAN, or ASIN 

     - returns: RequestBuilder<InlineResponse200> 
     */
    public class func convertCodeWithRequestBuilder(upcEanAsin upcEanAsin: String) -> RequestBuilder<InlineResponse200> {
        var path = "/api/v1/convert/{upc | ean | asin}"
        path = path.stringByReplacingOccurrencesOfString("{upc | ean | asin}", withString: "\(upcEanAsin)", options: .LiteralSearch, range: nil)
        let URLString = OpenAPIClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [:]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<InlineResponse200>.Type = OpenAPIClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: true)
    }

}
