# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'reddcoin/version'

Gem::Specification.new do |spec|
  spec.name          = "reddcoin"
  spec.version       = Reddcoin::VERSION
  spec.authors       = ["Gary Rafferty"]
  spec.email         = ["gary.rafferty@gmail.com"]
  spec.summary       = %q{Reddcoin API wrapper}
  spec.description   = %q{A ruby client for the Reddcoin API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty", "~> 0.13.1"
  
  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
