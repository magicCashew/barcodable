=begin
#Barcodable.com API

#Barcodable.com API

The version of the OpenAPI document: 1.5.0
Contact: support@barcodable.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.0

=end

require 'date'

module OpenapiClient
  class Item
    attr_accessor :upc

    attr_accessor :ean

    attr_accessor :isbn

    attr_accessor :asin

    attr_accessor :title

    attr_accessor :sku

    attr_accessor :mpn

    attr_accessor :part_number

    # A list of matching upc codes.
    attr_accessor :upcs

    attr_accessor :description

    attr_accessor :brand

    attr_accessor :manufacturer

    attr_accessor :color

    attr_accessor :new_price

    attr_accessor :used_price

    attr_accessor :currency_code

    attr_accessor :url

    # A list of product feature descriptions.
    attr_accessor :features

    # Product dimensions and weight.  ('meters', 'centimeters', 'millimeters', 'inches', 'feet', 'yards', 'ounces', 'pounds', 'grams', 'milligrams', 'kilograms')
    attr_accessor :dimensions

    # A list product images.
    attr_accessor :images

    # Matched items for this product.
    attr_accessor :matched_items

    # A list of country codes from which this item belongs.
    attr_accessor :iso_country_codes

    # The company name registered to the product's UPC or EAN.
    attr_accessor :company_name

    # The company address registered to the product's UPC or EAN.
    attr_accessor :company_address

    # A list of categories for this product.
    attr_accessor :categories

    # A list of category hierarchies for this product. Categories are listed in order of generic category to most specific category.
    attr_accessor :category_hierarchies

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'upc' => :'upc',
        :'ean' => :'ean',
        :'isbn' => :'isbn',
        :'asin' => :'asin',
        :'title' => :'title',
        :'sku' => :'sku',
        :'mpn' => :'mpn',
        :'part_number' => :'part_number',
        :'upcs' => :'upcs',
        :'description' => :'description',
        :'brand' => :'brand',
        :'manufacturer' => :'manufacturer',
        :'color' => :'color',
        :'new_price' => :'new_price',
        :'used_price' => :'used_price',
        :'currency_code' => :'currency_code',
        :'url' => :'url',
        :'features' => :'features',
        :'dimensions' => :'dimensions',
        :'images' => :'images',
        :'matched_items' => :'matched_items',
        :'iso_country_codes' => :'iso_country_codes',
        :'company_name' => :'company_name',
        :'company_address' => :'company_address',
        :'categories' => :'categories',
        :'category_hierarchies' => :'category_hierarchies'
      }
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'upc' => :'String',
        :'ean' => :'String',
        :'isbn' => :'String',
        :'asin' => :'String',
        :'title' => :'String',
        :'sku' => :'String',
        :'mpn' => :'String',
        :'part_number' => :'String',
        :'upcs' => :'Array<String>',
        :'description' => :'String',
        :'brand' => :'String',
        :'manufacturer' => :'String',
        :'color' => :'String',
        :'new_price' => :'Float',
        :'used_price' => :'Float',
        :'currency_code' => :'String',
        :'url' => :'String',
        :'features' => :'Array<String>',
        :'dimensions' => :'Array<Object>',
        :'images' => :'Array<String>',
        :'matched_items' => :'Array<Object>',
        :'iso_country_codes' => :'Array<String>',
        :'company_name' => :'String',
        :'company_address' => :'String',
        :'categories' => :'Array<String>',
        :'category_hierarchies' => :'Array<String>'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `OpenapiClient::Item` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `OpenapiClient::Item`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'upc')
        self.upc = attributes[:'upc']
      end

      if attributes.key?(:'ean')
        self.ean = attributes[:'ean']
      end

      if attributes.key?(:'isbn')
        self.isbn = attributes[:'isbn']
      end

      if attributes.key?(:'asin')
        self.asin = attributes[:'asin']
      end

      if attributes.key?(:'title')
        self.title = attributes[:'title']
      end

      if attributes.key?(:'sku')
        self.sku = attributes[:'sku']
      end

      if attributes.key?(:'mpn')
        self.mpn = attributes[:'mpn']
      end

      if attributes.key?(:'part_number')
        self.part_number = attributes[:'part_number']
      end

      if attributes.key?(:'upcs')
        if (value = attributes[:'upcs']).is_a?(Array)
          self.upcs = value
        end
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'brand')
        self.brand = attributes[:'brand']
      end

      if attributes.key?(:'manufacturer')
        self.manufacturer = attributes[:'manufacturer']
      end

      if attributes.key?(:'color')
        self.color = attributes[:'color']
      end

      if attributes.key?(:'new_price')
        self.new_price = attributes[:'new_price']
      end

      if attributes.key?(:'used_price')
        self.used_price = attributes[:'used_price']
      end

      if attributes.key?(:'currency_code')
        self.currency_code = attributes[:'currency_code']
      end

      if attributes.key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.key?(:'features')
        if (value = attributes[:'features']).is_a?(Array)
          self.features = value
        end
      end

      if attributes.key?(:'dimensions')
        if (value = attributes[:'dimensions']).is_a?(Array)
          self.dimensions = value
        end
      end

      if attributes.key?(:'images')
        if (value = attributes[:'images']).is_a?(Array)
          self.images = value
        end
      end

      if attributes.key?(:'matched_items')
        if (value = attributes[:'matched_items']).is_a?(Array)
          self.matched_items = value
        end
      end

      if attributes.key?(:'iso_country_codes')
        if (value = attributes[:'iso_country_codes']).is_a?(Array)
          self.iso_country_codes = value
        end
      end

      if attributes.key?(:'company_name')
        self.company_name = attributes[:'company_name']
      end

      if attributes.key?(:'company_address')
        self.company_address = attributes[:'company_address']
      end

      if attributes.key?(:'categories')
        if (value = attributes[:'categories']).is_a?(Array)
          self.categories = value
        end
      end

      if attributes.key?(:'category_hierarchies')
        if (value = attributes[:'category_hierarchies']).is_a?(Array)
          self.category_hierarchies = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          upc == o.upc &&
          ean == o.ean &&
          isbn == o.isbn &&
          asin == o.asin &&
          title == o.title &&
          sku == o.sku &&
          mpn == o.mpn &&
          part_number == o.part_number &&
          upcs == o.upcs &&
          description == o.description &&
          brand == o.brand &&
          manufacturer == o.manufacturer &&
          color == o.color &&
          new_price == o.new_price &&
          used_price == o.used_price &&
          currency_code == o.currency_code &&
          url == o.url &&
          features == o.features &&
          dimensions == o.dimensions &&
          images == o.images &&
          matched_items == o.matched_items &&
          iso_country_codes == o.iso_country_codes &&
          company_name == o.company_name &&
          company_address == o.company_address &&
          categories == o.categories &&
          category_hierarchies == o.category_hierarchies
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [upc, ean, isbn, asin, title, sku, mpn, part_number, upcs, description, brand, manufacturer, color, new_price, used_price, currency_code, url, features, dimensions, images, matched_items, iso_country_codes, company_name, company_address, categories, category_hierarchies].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.openapi_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        OpenapiClient.const_get(type).build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end
        
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end
  end
end
