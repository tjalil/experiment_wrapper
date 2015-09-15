# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'experiment_wrapper/version'

Gem::Specification.new do |spec|
  spec.name          = "experiment_wrapper"
  spec.version       = ExperimentWrapper::VERSION
  spec.authors       = ["Taha Jalil"]
  spec.email         = ["taha.jalil@gmail.com"]
  spec.summary       = %q{Gem to wrap BensBenzes.com API}
  spec.description   = %q{Gem to wrap BensBenzes.com API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"

  spec.add_dependency "faraday"
  spec.add_dependency "json"
end
