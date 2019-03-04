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
package org.openapitools.client.apis

import org.openapitools.client.models.InlineResponse200
import org.openapitools.client.models.InlineResponse400

import org.openapitools.client.infrastructure.*

class ProductConversionApi(basePath: kotlin.String = "https://virtserver.swaggerhub.com/magicCashew/barcodable/1.0.0") : ApiClient(basePath) {

    /**
    * Convert between UPC, EAN, and ASIN product codes.
    * Returns the converted UPC, EAN, and ASIN codes.
    * @param upcEanAsin UPC, EAN, or ASIN 
    * @return InlineResponse200
    */
    @Suppress("UNCHECKED_CAST")
    fun convertCode(upcEanAsin: kotlin.String) : InlineResponse200 {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf()
        val localVariableHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/api/v1/convert/{upc | ean | asin}".replace("{"+"upc | ean | asin"+"}", "$upcEanAsin"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<InlineResponse200>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as InlineResponse200
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

}