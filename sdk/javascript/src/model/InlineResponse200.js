/**
 * Barcodable.com API
 * Barcodable.com API
 *
 * OpenAPI spec version: 1.5.0
 * Contact: support@barcodable.com
 *
 * NOTE: This class is auto generated by OpenAPI Generator (https://openapi-generator.tech).
 * https://openapi-generator.tech
 *
 * OpenAPI Generator version: 4.0.0-beta2
 *
 * Do not edit the class manually.
 *
 */

(function(root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['ApiClient'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'));
  } else {
    // Browser globals (root is window)
    if (!root.BarcodablecomApi) {
      root.BarcodablecomApi = {};
    }
    root.BarcodablecomApi.InlineResponse200 = factory(root.BarcodablecomApi.ApiClient);
  }
}(this, function(ApiClient) {
  'use strict';



  /**
   * The InlineResponse200 model module.
   * @module model/InlineResponse200
   * @version 1.5.0
   */

  /**
   * Constructs a new <code>InlineResponse200</code>.
   * @alias module:model/InlineResponse200
   * @class
   */
  var exports = function() {
    var _this = this;

  };

  /**
   * Constructs a <code>InlineResponse200</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/InlineResponse200} obj Optional instance to populate.
   * @return {module:model/InlineResponse200} The populated <code>InlineResponse200</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('upcs')) {
        obj['upcs'] = ApiClient.convertToType(data['upcs'], ['String']);
      }
      if (data.hasOwnProperty('eans')) {
        obj['eans'] = ApiClient.convertToType(data['eans'], ['String']);
      }
      if (data.hasOwnProperty('asins')) {
        obj['asins'] = ApiClient.convertToType(data['asins'], ['String']);
      }
      if (data.hasOwnProperty('message')) {
        obj['message'] = ApiClient.convertToType(data['message'], 'String');
      }
    }
    return obj;
  }

  /**
   * A list of UPCs
   * @member {Array.<String>} upcs
   */
  exports.prototype['upcs'] = undefined;
  /**
   * A list of EANs
   * @member {Array.<String>} eans
   */
  exports.prototype['eans'] = undefined;
  /**
   * A list of ASINs
   * @member {Array.<String>} asins
   */
  exports.prototype['asins'] = undefined;
  /**
   * @member {String} message
   */
  exports.prototype['message'] = undefined;



  return exports;
}));


