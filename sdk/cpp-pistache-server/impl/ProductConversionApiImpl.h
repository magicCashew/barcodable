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
* ProductConversionApiImpl.h
*
* 
*/

#ifndef PRODUCT_CONVERSION_API_IMPL_H_
#define PRODUCT_CONVERSION_API_IMPL_H_


#include <pistache/endpoint.h>
#include <pistache/http.h>
#include <pistache/router.h>
#include <memory>

#include <ProductConversionApi.h>

#include <pistache/optional.h>

#include "Inline_response_200.h"
#include "Inline_response_400.h"
#include <string>

namespace org {
namespace openapitools {
namespace server {
namespace api {

using namespace org::openapitools::server::model;

class ProductConversionApiImpl : public org::openapitools::server::api::ProductConversionApi {
public:
    ProductConversionApiImpl(std::shared_ptr<Pistache::Rest::Router>);
    ~ProductConversionApiImpl() {}

    void convert_code(const std::string &upc_Pipe_ean_Pipe_asin, Pistache::Http::ResponseWriter &response);

};

}
}
}
}



#endif