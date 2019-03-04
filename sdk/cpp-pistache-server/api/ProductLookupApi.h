/**
* Barcodable.com API
* Barcodable.com API
*
* OpenAPI spec version: 1.5.0
* Contact: support@barcodable.com
*
* NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
* https://openapi-generator.tech
* Do not edit the class manually.
*/
/*
 * ProductLookupApi.h
 *
 * 
 */

#ifndef ProductLookupApi_H_
#define ProductLookupApi_H_


#include <pistache/http.h>
#include <pistache/router.h>
#include <pistache/http_headers.h>
#include <pistache/optional.h>


#include "Invalid_code.h"
#include "Item.h"
#include "Not_found.h"
#include <string>

namespace org {
namespace openapitools {
namespace server {
namespace api {

using namespace org::openapitools::server::model;

class  ProductLookupApi {
public:
    ProductLookupApi(std::shared_ptr<Pistache::Rest::Router>);
    virtual ~ProductLookupApi() {}
    void init();

    const std::string base = "/mindviser/barcodable/1.0.0";

private:
    void setupRoutes();

    void get_item_by_asin_handler(const Pistache::Rest::Request &request, Pistache::Http::ResponseWriter response);
    void get_item_by_ean_handler(const Pistache::Rest::Request &request, Pistache::Http::ResponseWriter response);
    void get_item_by_upc_handler(const Pistache::Rest::Request &request, Pistache::Http::ResponseWriter response);
    void product_lookup_api_default_handler(const Pistache::Rest::Request &request, Pistache::Http::ResponseWriter response);

    std::shared_ptr<Pistache::Rest::Router> router;

    /// <summary>
    /// Find item by asin code
    /// </summary>
    /// <remarks>
    /// Returns a single item
    /// </remarks>
    /// <param name="asin">ASIN code of item to return</param>
    virtual void get_item_by_asin(const std::string &asin, Pistache::Http::ResponseWriter &response) = 0;

    /// <summary>
    /// Find item by UPC code
    /// </summary>
    /// <remarks>
    /// Returns a single item
    /// </remarks>
    /// <param name="ean">EAN code of item to return</param>
    virtual void get_item_by_ean(const std::string &ean, Pistache::Http::ResponseWriter &response) = 0;

    /// <summary>
    /// Find item by UPC code
    /// </summary>
    /// <remarks>
    /// Returns a single item
    /// </remarks>
    /// <param name="upc">UPC code of item to return</param>
    virtual void get_item_by_upc(const std::string &upc, Pistache::Http::ResponseWriter &response) = 0;

};

}
}
}
}

#endif /* ProductLookupApi_H_ */

