# -*- encoding: utf-8 -*-

=begin
#Barcodable.com API

#Barcodable.com API

The version of the OpenAPI document: 1.5.0
Contact: support@barcodable.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 4.3.0

=end

$:.push File.expand_path("../lib", __FILE__)
require "openapi_client/version"

Gem::Specification.new do |s|
  s.name        = "openapi_client"
  s.version     = OpenapiClient::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["OpenAPI-Generator"]
  s.email       = ["support@barcodable.com"]
  s.homepage    = "https://openapi-generator.tech"
  s.summary     = "Barcodable.com API Ruby Gem"
  s.description = "Barcodable.com API"
  s.license     = "Unlicense"
  s.required_ruby_version = ">= 1.9"

  s.add_runtime_dependency 'typhoeus', '~> 1.0', '>= 1.0.1'
  s.add_runtime_dependency 'json', '~> 2.1', '>= 2.1.0'

  s.add_development_dependency 'rspec', '~> 3.6', '>= 3.6.0'

  s.files         = `find *`.split("\n").uniq.sort.select { |f| !f.empty? }
  s.test_files    = `find spec/*`.split("\n")
  s.executables   = []
  s.require_paths = ["lib"]
end
