# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'alma/client/version'

Gem::Specification.new do |spec|
  spec.name          = "alma-client"
  spec.version       = Alma::Client::VERSION
  spec.authors       = ["Teppei Fukuda"]
  spec.email         = ["put.a.feud.pike011235@gmail.com"]

  spec.summary       = %q{Client commands and libraries for Alma}
  spec.description   = %q{Client commands and libraries for Alma}
  spec.homepage      = "http://github.com/knqyf263/alma-client"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "msgpack-rpc-over-http", "~> 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
