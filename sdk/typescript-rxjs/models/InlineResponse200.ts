// tslint:disable
/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * The version of the OpenAPI document: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 * Do not edit the class manually.
 */

/**
 * @export
 * @interface InlineResponse200
 */
export interface InlineResponse200 {
    /**
     * A list of UPCs
     * @type {Array<string>}
     * @memberof InlineResponse200
     */
    upcs?: Array<string>;
    /**
     * A list of EANs
     * @type {Array<string>}
     * @memberof InlineResponse200
     */
    eans?: Array<string>;
    /**
     * A list of ASINs
     * @type {Array<string>}
     * @memberof InlineResponse200
     */
    asins?: Array<string>;
    /**
     * @type {string}
     * @memberof InlineResponse200
     */
    message?: string;
}
