=begin
#Barcodable.com API

#Barcodable.com API

OpenAPI spec version: 1.5.0
Contact: support@barcodable.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.0.0-beta2

=end

require 'uri'

module OpenapiClient
  class ProductLookupApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Find item by asin code
    # Returns a single item
    # @param asin ASIN code of item to return
    # @param [Hash] opts the optional parameters
    # @return [Item]
    def get_item_by_asin(asin, opts = {})
      data, _status_code, _headers = get_item_by_asin_with_http_info(asin, opts)
      data
    end

    # Find item by asin code
    # Returns a single item
    # @param asin ASIN code of item to return
    # @param [Hash] opts the optional parameters
    # @return [Array<(Item, Fixnum, Hash)>] Item data, response status code and response headers
    def get_item_by_asin_with_http_info(asin, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductLookupApi.get_item_by_asin ...'
      end
      # verify the required parameter 'asin' is set
      if @api_client.config.client_side_validation && asin.nil?
        fail ArgumentError, "Missing the required parameter 'asin' when calling ProductLookupApi.get_item_by_asin"
      end
      # resource path
      local_var_path = '/api/v1/asin/{asin}'.sub('{' + 'asin' + '}', asin.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Item')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductLookupApi#get_item_by_asin\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find item by UPC code
    # Returns a single item
    # @param ean EAN code of item to return
    # @param [Hash] opts the optional parameters
    # @return [Item]
    def get_item_by_ean(ean, opts = {})
      data, _status_code, _headers = get_item_by_ean_with_http_info(ean, opts)
      data
    end

    # Find item by UPC code
    # Returns a single item
    # @param ean EAN code of item to return
    # @param [Hash] opts the optional parameters
    # @return [Array<(Item, Fixnum, Hash)>] Item data, response status code and response headers
    def get_item_by_ean_with_http_info(ean, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductLookupApi.get_item_by_ean ...'
      end
      # verify the required parameter 'ean' is set
      if @api_client.config.client_side_validation && ean.nil?
        fail ArgumentError, "Missing the required parameter 'ean' when calling ProductLookupApi.get_item_by_ean"
      end
      # resource path
      local_var_path = '/api/v1/ean/{ean}'.sub('{' + 'ean' + '}', ean.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Item')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductLookupApi#get_item_by_ean\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Find item by UPC code
    # Returns a single item
    # @param upc UPC code of item to return
    # @param [Hash] opts the optional parameters
    # @return [Item]
    def get_item_by_upc(upc, opts = {})
      data, _status_code, _headers = get_item_by_upc_with_http_info(upc, opts)
      data
    end

    # Find item by UPC code
    # Returns a single item
    # @param upc UPC code of item to return
    # @param [Hash] opts the optional parameters
    # @return [Array<(Item, Fixnum, Hash)>] Item data, response status code and response headers
    def get_item_by_upc_with_http_info(upc, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ProductLookupApi.get_item_by_upc ...'
      end
      # verify the required parameter 'upc' is set
      if @api_client.config.client_side_validation && upc.nil?
        fail ArgumentError, "Missing the required parameter 'upc' when calling ProductLookupApi.get_item_by_upc"
      end
      # resource path
      local_var_path = '/api/v1/upc/{upc}'.sub('{' + 'upc' + '}', upc.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Item')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ProductLookupApi#get_item_by_upc\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

  end
end