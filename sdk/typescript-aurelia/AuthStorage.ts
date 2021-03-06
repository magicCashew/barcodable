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
 * Class to storage authentication data
 */
export class AuthStorage {
  private storage: Map<string, string>;

  constructor() {
    this.storage = new Map();
  }

  /**
   * Sets the ApiKeyAuth auth method value.
   *
   * @param value The new value to set for ApiKeyAuth.
   */
  setApiKeyAuth(value: string): this {
    this.storage.set('ApiKeyAuth', value);
    return this;
  }

  /**
   * Removes the ApiKeyAuth auth method value.
   */
  removeApiKeyAuth(): this {
    this.storage.delete('ApiKeyAuth');
    return this;
  }

  /**
   * Gets the ApiKeyAuth auth method value.
   */
  getApiKeyAuth(): null | string {
    return this.storage.get('ApiKeyAuth') || null;
  }
}
