# Rust API client for openapi

Barcodable.com API

## Overview
This API client was generated by the [OpenAPI Generator](https://openapi-generator.tech) project.  By using the [openapi-spec](https://openapis.org) from a remote server, you can easily generate an API client.

- API version: 1.5.0
- Package version: 1.0.0
- Build package: org.openapitools.codegen.languages.RustClientCodegen

## Installation
Put the package under your project folder and add the following in import:
```
    "./openapi"
```

## Documentation for API Endpoints

All URIs are relative to *https://virtserver.swaggerhub.com/magicCashew/barcodable/1.0.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ProductConversionApi* | [**convert_code**](docs/ProductConversionApi.md#convert_code) | **Get** /api/v1/convert/{upc | ean | asin} | Convert between UPC, EAN, and ASIN product codes.
*ProductLookupApi* | [**get_item_by_asin**](docs/ProductLookupApi.md#get_item_by_asin) | **Get** /api/v1/asin/{asin} | Find item by asin code
*ProductLookupApi* | [**get_item_by_ean**](docs/ProductLookupApi.md#get_item_by_ean) | **Get** /api/v1/ean/{ean} | Find item by UPC code
*ProductLookupApi* | [**get_item_by_upc**](docs/ProductLookupApi.md#get_item_by_upc) | **Get** /api/v1/upc/{upc} | Find item by UPC code


## Documentation For Models

 - [InlineResponse200](docs/InlineResponse200.md)
 - [InlineResponse400](docs/InlineResponse400.md)
 - [InvalidCode](docs/InvalidCode.md)
 - [Item](docs/Item.md)
 - [NotFound](docs/NotFound.md)


## Documentation For Authorization

## ApiKeyAuth
- **Type**: API key 

Example
```
	auth := context.WithValue(context.TODO(), sw.ContextAPIKey, sw.APIKey{
		Key: "APIKEY",
		Prefix: "Bearer", // Omit if not necessary.
	})
    r, err := client.Service.Operation(auth, args)
```

## Author

support@barcodable.com
