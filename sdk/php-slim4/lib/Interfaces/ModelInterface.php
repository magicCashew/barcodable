<?php

/**
 * ModelInterface
 *
 * PHP version 7.1
 *
 * @package OpenAPIServer
 * @author  OpenAPI Generator team
 * @link    https://github.com/openapitools/openapi-generator
 */

/**
 * Barcodable.com API
 *
 * Barcodable.com API
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 * Generated by: https://github.com/openapitools/openapi-generator.git
 */

/**
 * NOTE: This class is auto generated by the openapi generator program.
 * https://github.com/openapitools/openapi-generator
 * Do not edit the class manually.
 */
namespace OpenAPIServer\Interfaces;

/**
 * ModelInterface Class Doc Comment
 *
 * @package OpenAPIServer\Interfaces
 * @author  OpenAPI Generator team
 * @link    https://github.com/openapitools/openapi-generator
 */
interface ModelInterface
{
    /**
     * Returns model schema.
     *
     * @param bool $assoc When TRUE, returned objects will be converted into associative arrays. Default FALSE.
     *
     * @return array
     */
    public static function getOpenApiSchema($assoc = false);
}
