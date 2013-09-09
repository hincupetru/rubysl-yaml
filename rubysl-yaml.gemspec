# coding: utf-8
require './lib/rubysl/yaml/version'

Gem::Specification.new do |spec|
  spec.name          = "rubysl-yaml"
  spec.version       = RubySL::YAML::VERSION
  spec.authors       = ["Brian Shirai"]
  spec.email         = ["brixen@gmail.com"]
  spec.description   = %q{Ruby standard library YAML.}
  spec.summary       = %q{Ruby standard library YAML.}
  spec.homepage      = "https://github.com/rubysl/rubysl-yaml"
  spec.license       = "BSD"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = "~> 1.8.7"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "mspec", "~> 1.5"
  spec.add_development_dependency "rubysl-prettyprint", "~> 1.0"
end
