lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'fern/api/version'

Gem::Specification.new do |s|
  s.name        = 'fern-api'
  s.version     = Fern::Api::VERSION
  s.date        = '2017-03-11'
  s.authors     = ['Kyle Kestell']
  s.email       = 'kyle@kestell.org'
  s.summary     = 'Fern API'
  s.description = 'API DSL for Fern.'
  s.homepage    = 'https://github.com/kkestell/fern-api'
  s.license     = 'MIT'
  s.files       = Dir['lib/**/*']

  s.required_ruby_version = '>= 2.0.0'

  s.add_development_dependency 'rake', '~> 10.0'
  s.add_development_dependency 'minitest', '~> 5.0'
  s.add_runtime_dependency 'activesupport', '~> 5.0'
  s.add_runtime_dependency 'actionpack', '~> 5.0'
end
