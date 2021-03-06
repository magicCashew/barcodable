<?php

/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI-Generator
 * https://openapi-generator.tech
 * Do not edit the class manually.
 *
 * Source files are located at:
 *
 * > https://github.com/OpenAPITools/openapi-generator/blob/master/modules/openapi-generator/src/main/resources/php-laravel/
 */

/**
 * get convertCode
 * Summary: Convert between UPC, EAN, and ASIN product codes.
 * Notes: Returns the converted UPC, EAN, and ASIN codes.
 * Output-Formats: [application/json]
 */
Route::get('/magicCashew/barcodable/1.0.0/api/v1/convert/{upc | ean | asin}', 'ProductConversionController@convertCode');
/**
 * get getItemByASIN
 * Summary: Find item by asin code
 * Notes: Returns a single item
 * Output-Formats: [application/json]
 */
Route::get('/magicCashew/barcodable/1.0.0/api/v1/asin/{asin}', 'ProductLookupController@getItemByASIN');
/**
 * get getItemByEAN
 * Summary: Find item by UPC code
 * Notes: Returns a single item
 * Output-Formats: [application/json]
 */
Route::get('/magicCashew/barcodable/1.0.0/api/v1/ean/{ean}', 'ProductLookupController@getItemByEAN');
/**
 * get getItemByUPC
 * Summary: Find item by UPC code
 * Notes: Returns a single item
 * Output-Formats: [application/json]
 */
Route::get('/magicCashew/barcodable/1.0.0/api/v1/upc/{upc}', 'ProductLookupController@getItemByUPC');

