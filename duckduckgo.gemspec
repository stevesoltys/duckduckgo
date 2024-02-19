# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'duckduckgo/version'

Gem::Specification.new do |spec|
  spec.name          = 'duckduckgo'
  spec.version       = DuckDuckGo::VERSION
  spec.authors       = ['Steve Soltys']
  spec.email         = ['stevesoltys@live.com']

  spec.summary       = %q{An unofficial DuckDuckGo search API.}
  spec.homepage      = 'https://github.com/stevesoltys/duckduckgo'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16.1'
  spec.add_development_dependency 'minitest', '~> 5.11.3'
  spec.add_development_dependency 'rake', '~> 12.3.1'
  spec.add_dependency 'nokogiri', '~> 1.16.2'
  spec.add_dependency 'open_uri_redirections', '~> 0.2.1'
end
