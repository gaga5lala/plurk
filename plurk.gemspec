# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'plurk/version'

Gem::Specification.new do |spec|
  spec.name          = "plurk"
  spec.version       = Plurk::VERSION
  spec.authors       = ["gaga5lala"]
  spec.email         = ["gaga5lala1013@gmail.com"]

  spec.summary       = %q{Plurk API wrapper}
  spec.description   = %q{Plurk API wrapper}
  spec.homepage      = "https://github.com/gaga5lala/plurk"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "oauth", "~> 0.3.0"
end
