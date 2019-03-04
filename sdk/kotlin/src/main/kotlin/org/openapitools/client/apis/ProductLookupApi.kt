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

import org.openapitools.client.models.InvalidCode
import org.openapitools.client.models.Item
import org.openapitools.client.models.NotFound

import org.openapitools.client.infrastructure.*

class ProductLookupApi(basePath: kotlin.String = "https://virtserver.swaggerhub.com/mindviser/barcodable/1.0.0") : ApiClient(basePath) {

    /**
    * Find item by asin code
    * Returns a single item
    * @param asin ASIN code of item to return 
    * @return Item
    */
    @Suppress("UNCHECKED_CAST")
    fun getItemByASIN(asin: kotlin.String) : Item {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf()
        val localVariableHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/api/v1/asin/{asin}".replace("{"+"asin"+"}", "$asin"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Item>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as Item
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Find item by UPC code
    * Returns a single item
    * @param ean EAN code of item to return 
    * @return Item
    */
    @Suppress("UNCHECKED_CAST")
    fun getItemByEAN(ean: kotlin.String) : Item {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf()
        val localVariableHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/api/v1/ean/{ean}".replace("{"+"ean"+"}", "$ean"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Item>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as Item
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

    /**
    * Find item by UPC code
    * Returns a single item
    * @param upc UPC code of item to return 
    * @return Item
    */
    @Suppress("UNCHECKED_CAST")
    fun getItemByUPC(upc: kotlin.String) : Item {
        val localVariableBody: kotlin.Any? = null
        val localVariableQuery: MultiValueMap = mapOf()
        val localVariableHeaders: kotlin.collections.Map<kotlin.String,kotlin.String> = mapOf()
        val localVariableConfig = RequestConfig(
            RequestMethod.GET,
            "/api/v1/upc/{upc}".replace("{"+"upc"+"}", "$upc"),
            query = localVariableQuery,
            headers = localVariableHeaders
        )
        val response = request<Item>(
            localVariableConfig,
            localVariableBody
        )

        return when (response.responseType) {
            ResponseType.Success -> (response as Success<*>).data as Item
            ResponseType.Informational -> TODO()
            ResponseType.Redirection -> TODO()
            ResponseType.ClientError -> throw ClientException((response as ClientError<*>).body as? String ?: "Client error")
            ResponseType.ServerError -> throw ServerException((response as ServerError<*>).message ?: "Server error")
            else -> throw kotlin.IllegalStateException("Undefined ResponseType.")
        }
    }

}
