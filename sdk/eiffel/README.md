# Eiffel API client for openapi

Barcodable.com API

## Overview
This API client was generated by the [OpenAPI Generator](https://openapi-generator.tech) project.  By using the [openapi-spec](https://openapis.org) from a remote server, you can easily generate an API client.

- API version: 1.5.0
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.EiffelClientCodegen

## Installation
Add the library into your Eiffel configuration file.
```
    "<library name="api_client" location="%PATH_TO_EIFFEL_OPENAPI_CLIENT%\api_client.ecf"/>"
```

## Documentation for API Endpoints

All URIs are relative to *https://virtserver.swaggerhub.com/magicCashew/barcodable/1.0.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*PRODUCTCONVERSION_API* | [**convert_code**](docs/PRODUCTCONVERSION_API.md#convert_code) | **Get** /api/v1/convert/{upc | ean | asin} | Convert between UPC, EAN, and ASIN product codes.
*PRODUCTLOOKUP_API* | [**item_by_as_in**](docs/PRODUCTLOOKUP_API.md#item_by_as_in) | **Get** /api/v1/asin/{asin} | Find item by asin code
*PRODUCTLOOKUP_API* | [**item_by_ea_n**](docs/PRODUCTLOOKUP_API.md#item_by_ea_n) | **Get** /api/v1/ean/{ean} | Find item by UPC code
*PRODUCTLOOKUP_API* | [**item_by_up_c**](docs/PRODUCTLOOKUP_API.md#item_by_up_c) | **Get** /api/v1/upc/{upc} | Find item by UPC code


## Documentation For Models

 - [INLINE_RESPONSE_200](docs/INLINE_RESPONSE_200.md)
 - [INLINE_RESPONSE_400](docs/INLINE_RESPONSE_400.md)
 - [INVALID_CODE](docs/INVALID_CODE.md)
 - [ITEM](docs/ITEM.md)
 - [NOT_FOUND](docs/NOT_FOUND.md)


## Documentation For Authorization


## ApiKeyAuth

- **Type**: API key 
- **API key parameter name**: Authorization
- **Location**: HTTP header


## Author

support@barcodable.com

