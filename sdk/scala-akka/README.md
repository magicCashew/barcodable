# openapi-client

Barcodable.com API
- API version: 1.5.0

Barcodable.com API


*Automatically generated by the [OpenAPI Generator](https://openapi-generator.tech)*

## Requirements

Building the API client library requires:
1. Java 1.7+
2. Maven/Gradle/SBT

## Installation

To install the API client library to your local Maven repository, simply execute:

```shell
mvn clean install
```

To deploy it to a remote Maven repository instead, configure the settings of the repository and execute:

```shell
mvn clean deploy
```

Refer to the [OSSRH Guide](http://central.sonatype.org/pages/ossrh-guide.html) for more information.

### Maven users

Add this dependency to your project's POM:

```xml
<dependency>
  <groupId>org.openapitools</groupId>
  <artifactId>openapi-client</artifactId>
  <version>1.0.0</version>
  <scope>compile</scope>
</dependency>
```

### Gradle users

Add this dependency to your project's build file:

```groovy
compile "org.openapitools:openapi-client:1.0.0"
```

### SBT users

```scala
libraryDependencies += "org.openapitools" % "openapi-client" % "1.0.0"
```

## Getting Started

## Documentation for API Endpoints

All URIs are relative to *https://virtserver.swaggerhub.com/magicCashew/barcodable/1.0.0*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*ProductConversionApi* | **convertCode** | **GET** /api/v1/convert/{upc | ean | asin} | Convert between UPC, EAN, and ASIN product codes.
*ProductLookupApi* | **getItemByASIN** | **GET** /api/v1/asin/{asin} | Find item by asin code
*ProductLookupApi* | **getItemByEAN** | **GET** /api/v1/ean/{ean} | Find item by UPC code
*ProductLookupApi* | **getItemByUPC** | **GET** /api/v1/upc/{upc} | Find item by UPC code


## Documentation for Models

 - [InlineResponse200](InlineResponse200.md)
 - [InlineResponse400](InlineResponse400.md)
 - [InvalidCode](InvalidCode.md)
 - [Item](Item.md)
 - [NotFound](NotFound.md)


## Documentation for Authorization

Authentication schemes defined for the API:
### ApiKeyAuth

- **Type**: API key
- **API key parameter name**: Authorization
- **Location**: HTTP header


## Author

support@barcodable.com