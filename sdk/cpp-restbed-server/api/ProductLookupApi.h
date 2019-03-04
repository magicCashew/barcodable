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

/*
 * ProductLookupApi.h
 *
 * 
 */

#ifndef ProductLookupApi_H_
#define ProductLookupApi_H_


#include <memory>
#include <corvusoft/restbed/session.hpp>
#include <corvusoft/restbed/resource.hpp>
#include <corvusoft/restbed/service.hpp>

#include "Invalid_code.h"
#include "Item.h"
#include "Not_found.h"
#include <string>

namespace org {
namespace openapitools {
namespace server {
namespace api {

using namespace org::openapitools::server::model;

class  ProductLookupApi: public restbed::Service
{
public:
	ProductLookupApi();
	~ProductLookupApi();
	void startService(int const& port);
	void stopService();
};


/// <summary>
/// Find item by asin code
/// </summary>
/// <remarks>
/// Returns a single item
/// </remarks>
class  ProductLookupApiApiV1AsinAsinResource: public restbed::Resource
{
public:
	ProductLookupApiApiV1AsinAsinResource();
    virtual ~ProductLookupApiApiV1AsinAsinResource();
    void GET_method_handler(const std::shared_ptr<restbed::Session> session);
};

/// <summary>
/// Find item by UPC code
/// </summary>
/// <remarks>
/// Returns a single item
/// </remarks>
class  ProductLookupApiApiV1EanEanResource: public restbed::Resource
{
public:
	ProductLookupApiApiV1EanEanResource();
    virtual ~ProductLookupApiApiV1EanEanResource();
    void GET_method_handler(const std::shared_ptr<restbed::Session> session);
};

/// <summary>
/// Find item by UPC code
/// </summary>
/// <remarks>
/// Returns a single item
/// </remarks>
class  ProductLookupApiApiV1UpcUpcResource: public restbed::Resource
{
public:
	ProductLookupApiApiV1UpcUpcResource();
    virtual ~ProductLookupApiApiV1UpcUpcResource();
    void GET_method_handler(const std::shared_ptr<restbed::Session> session);
};


}
}
}
}

#endif /* ProductLookupApi_H_ */

