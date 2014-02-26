# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails_spec_harness/version'

Gem::Specification.new do |spec|
  spec.name          = 'rails_spec_harness'
  spec.version       = RailsSpecHarness::VERSION
  spec.authors       = ['alexpeachey']
  spec.email         = ['alex.peachey@gmail.com']
  spec.summary       = 'Helpful generators for fast rails specs.'
  spec.description   = 'Make your specs sane with a set of helpers to isolate code and improve speed.'
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'rails', '>= 3.0.0'

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake', '~> 10.1'
  spec.add_development_dependency 'rspec', '~> 2.14'
end
