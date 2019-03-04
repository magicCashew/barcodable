/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * OpenAPI spec version: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI-Generator 4.0.0-beta2.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */


#include <corvusoft/restbed/byte.hpp>
#include <corvusoft/restbed/string.hpp>
#include <corvusoft/restbed/settings.hpp>
#include <corvusoft/restbed/request.hpp>

#include "ProductLookupApi.h"

namespace org {
namespace openapitools {
namespace server {
namespace api {

using namespace org::openapitools::server::model;

ProductLookupApi::ProductLookupApi() {
	std::shared_ptr<ProductLookupApiApiV1AsinAsinResource> spProductLookupApiApiV1AsinAsinResource = std::make_shared<ProductLookupApiApiV1AsinAsinResource>();
	this->publish(spProductLookupApiApiV1AsinAsinResource);
	
	std::shared_ptr<ProductLookupApiApiV1EanEanResource> spProductLookupApiApiV1EanEanResource = std::make_shared<ProductLookupApiApiV1EanEanResource>();
	this->publish(spProductLookupApiApiV1EanEanResource);
	
	std::shared_ptr<ProductLookupApiApiV1UpcUpcResource> spProductLookupApiApiV1UpcUpcResource = std::make_shared<ProductLookupApiApiV1UpcUpcResource>();
	this->publish(spProductLookupApiApiV1UpcUpcResource);
	
}

ProductLookupApi::~ProductLookupApi() {}

void ProductLookupApi::startService(int const& port) {
	std::shared_ptr<restbed::Settings> settings = std::make_shared<restbed::Settings>();
	settings->set_port(port);
	settings->set_root("/magicCashew/barcodable/1.0.0");
	
	this->start(settings);
}

void ProductLookupApi::stopService() {
	this->stop();
}

ProductLookupApiApiV1AsinAsinResource::ProductLookupApiApiV1AsinAsinResource()
{
	this->set_path("/api/v1/asin/{asin: .*}/");
	this->set_method_handler("GET",
		std::bind(&ProductLookupApiApiV1AsinAsinResource::GET_method_handler, this,
			std::placeholders::_1));
}

ProductLookupApiApiV1AsinAsinResource::~ProductLookupApiApiV1AsinAsinResource()
{
}

void ProductLookupApiApiV1AsinAsinResource::GET_method_handler(const std::shared_ptr<restbed::Session> session) {

	const auto request = session->get_request();
			
			// Getting the path params
			const std::string asin = request->get_path_parameter("asin", "");
			

			
			// Change the value of this variable to the appropriate response before sending the response
			int status_code = 200;
			
			/**
			 * Process the received information here
			 */
			
			if (status_code == 200) {
				// Description: A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return &#39;false&#39;.
				session->set_header("X-ValidAuthorization", ""); // Change second param to your header value
				// Description: An integer specifying the number of requests available per day. This number is definied by your subscription plan.
				session->set_header("X-RateLimit-Limit", ""); // Change second param to your header value
				// Description: An integer specifying the number of remaining requests per day.
				session->set_header("X-RateLimit-Remaining", ""); // Change second param to your header value
				// Description: A timestamp specifying the time in which the daily rate limit is reset.
				session->set_header("X-RateLimit-Reset", ""); // Change second param to your header value
				session->close(200, "successful operation", { {"Connection", "close"} });
				return;
			}
			if (status_code == 400) {
				session->close(400, "search results matching criteria", { {"Connection", "close"} });
				return;
			}
			if (status_code == 404) {
				session->close(404, "search results matching criteria", { {"Connection", "close"} });
				return;
			}

}



ProductLookupApiApiV1EanEanResource::ProductLookupApiApiV1EanEanResource()
{
	this->set_path("/api/v1/ean/{ean: .*}/");
	this->set_method_handler("GET",
		std::bind(&ProductLookupApiApiV1EanEanResource::GET_method_handler, this,
			std::placeholders::_1));
}

ProductLookupApiApiV1EanEanResource::~ProductLookupApiApiV1EanEanResource()
{
}

void ProductLookupApiApiV1EanEanResource::GET_method_handler(const std::shared_ptr<restbed::Session> session) {

	const auto request = session->get_request();
			
			// Getting the path params
			const std::string ean = request->get_path_parameter("ean", "");
			

			
			// Change the value of this variable to the appropriate response before sending the response
			int status_code = 200;
			
			/**
			 * Process the received information here
			 */
			
			if (status_code == 200) {
				// Description: A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return &#39;false&#39;.
				session->set_header("X-ValidAuthorization", ""); // Change second param to your header value
				// Description: An integer specifying the number of requests available per day. This number is definied by your subscription plan.
				session->set_header("X-RateLimit-Limit", ""); // Change second param to your header value
				// Description: An integer specifying the number of remaining requests per day.
				session->set_header("X-RateLimit-Remaining", ""); // Change second param to your header value
				// Description: A timestamp specifying the time in which the daily rate limit is reset.
				session->set_header("X-RateLimit-Reset", ""); // Change second param to your header value
				session->close(200, "successful operation", { {"Connection", "close"} });
				return;
			}
			if (status_code == 400) {
				session->close(400, "search results matching criteria", { {"Connection", "close"} });
				return;
			}
			if (status_code == 404) {
				session->close(404, "search results matching criteria", { {"Connection", "close"} });
				return;
			}

}



ProductLookupApiApiV1UpcUpcResource::ProductLookupApiApiV1UpcUpcResource()
{
	this->set_path("/api/v1/upc/{upc: .*}/");
	this->set_method_handler("GET",
		std::bind(&ProductLookupApiApiV1UpcUpcResource::GET_method_handler, this,
			std::placeholders::_1));
}

ProductLookupApiApiV1UpcUpcResource::~ProductLookupApiApiV1UpcUpcResource()
{
}

void ProductLookupApiApiV1UpcUpcResource::GET_method_handler(const std::shared_ptr<restbed::Session> session) {

	const auto request = session->get_request();
			
			// Getting the path params
			const std::string upc = request->get_path_parameter("upc", "");
			

			
			// Change the value of this variable to the appropriate response before sending the response
			int status_code = 200;
			
			/**
			 * Process the received information here
			 */
			
			if (status_code == 200) {
				// Description: A boolean indicating whether the API key in use is valid. Requests with an invalid subscription, incorrect key, or no key will return &#39;false&#39;.
				session->set_header("X-ValidAuthorization", ""); // Change second param to your header value
				// Description: An integer specifying the number of requests available per day. This number is definied by your subscription plan.
				session->set_header("X-RateLimit-Limit", ""); // Change second param to your header value
				// Description: An integer specifying the number of remaining requests per day.
				session->set_header("X-RateLimit-Remaining", ""); // Change second param to your header value
				// Description: A timestamp specifying the time in which the daily rate limit is reset.
				session->set_header("X-RateLimit-Reset", ""); // Change second param to your header value
				session->close(200, "successful operation", { {"Connection", "close"} });
				return;
			}
			if (status_code == 400) {
				session->close(400, "search results matching criteria", { {"Connection", "close"} });
				return;
			}
			if (status_code == 404) {
				session->close(404, "search results matching criteria", { {"Connection", "close"} });
				return;
			}

}




}
}
}
}

