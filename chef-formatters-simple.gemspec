# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'chef/formatters/simple/version'

Gem::Specification.new do |spec|
  spec.name          = "chef-formatters-simple"
  spec.version       = Chef::Formatters::Simple::VERSION
  spec.authors       = ["sakazuki"]
  spec.email         = ["sakazuki@gmail.com"]
  spec.summary       = %q{chef-client simple formatter}
  spec.description   = %q{chef-client simple formatter outputs that minimal's output plus delta}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
