Pod::Spec.new do |s|
  s.name = 'OpenAPIClient'
  s.ios.deployment_target = '9.0'
  s.osx.deployment_target = '10.11'
  s.tvos.deployment_target = '9.0'
  s.version = '1.5.0'
  s.source = { :git => 'git@github.com:OpenAPITools/openapi-generator.git', :tag => 'v1.5.0' }
  s.authors = 'OpenAPI Generator'
  s.license = 'Proprietary'
  s.homepage = 'https://github.com/OpenAPITools/openapi-generator'
  s.summary = 'OpenAPIClient Swift SDK'
  s.source_files = 'OpenAPIClient/Classes/**/*.swift'
  s.dependency 'Alamofire', '~> 4.7.0'
end
