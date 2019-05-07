# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'smsapi/smsapi'

Gem::Specification.new do |spec|
  spec.name          = "smsapi-client"
  spec.version       = Smsapi::VERSION
  spec.authors       = ['Alek Niemczyk', 'Michal Musialik', 'Marek Machula']
  spec.email         = ['info@rubylogic.pl']

  spec.summary       = 'SMSAPI.pl Ruby client'
  spec.description   = 'SMSAPI.pl Ruby client created by Ruby Logic S.C.'
  spec.homepage      = 'https://github.com/ruby-logic/smsapi-client'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
end
