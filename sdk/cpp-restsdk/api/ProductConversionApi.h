/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI-Generator 4.3.0.
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

/*
 * ProductConversionApi.h
 *
 * 
 */

#ifndef ORG_OPENAPITOOLS_CLIENT_API_ProductConversionApi_H_
#define ORG_OPENAPITOOLS_CLIENT_API_ProductConversionApi_H_


#include "../ApiClient.h"

#include "Inline_response_200.h"
#include "Inline_response_400.h"
#include <cpprest/details/basic_types.h>


#include <boost/optional.hpp>

namespace org {
namespace openapitools {
namespace client {
namespace api {

using namespace org::openapitools::client::model;



class  ProductConversionApi 
{
public:

    explicit ProductConversionApi( std::shared_ptr<const ApiClient> apiClient );

    virtual ~ProductConversionApi();

    /// <summary>
    /// Convert between UPC, EAN, and ASIN product codes.
    /// </summary>
    /// <remarks>
    /// Returns the converted UPC, EAN, and ASIN codes.
    /// </remarks>
    /// <param name="upc_Pipe_ean_Pipe_asin">UPC, EAN, or ASIN</param>
    pplx::task<std::shared_ptr<Inline_response_200>> convertCode(
        utility::string_t upc_Pipe_ean_Pipe_asin
    ) const;

protected:
    std::shared_ptr<const ApiClient> m_ApiClient;
};

}
}
}
}

#endif /* ORG_OPENAPITOOLS_CLIENT_API_ProductConversionApi_H_ */

