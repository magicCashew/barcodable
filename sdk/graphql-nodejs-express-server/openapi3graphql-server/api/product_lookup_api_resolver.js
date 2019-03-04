/**
 * 
 * Barcodable.com API
 * 
 * 
 * Barcodable.com API
 * 
 * Version: 1.5.0
 * Contact: support@barcodable.com
 * Generated by OpenAPI Generator: https://openapi-generator.tech
 */

// package openapi3graphql-server

// product_lookup_api

export default {
    Query: {

        // @return Item
        GetItemByASIN: ($asin) => {
            return {
                "asin": "asin_example"
            };
        },

        // @return Item
        GetItemByEAN: ($ean) => {
            return {
                "ean": "ean_example"
            };
        },

        // @return Item
        GetItemByUPC: ($upc) => {
            return {
                "upc": "upc_example"
            };
        },

    },

    Mutation: {

    }
}