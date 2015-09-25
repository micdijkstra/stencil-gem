# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stencil/version'

Gem::Specification.new do |spec|
  spec.name          = "stencil"
  spec.version       = Stencil::VERSION
  spec.authors       = ["Michael Dijkstra"]
  spec.email         = ["michael@xxix.co"]
  spec.summary       = "A workflow gem"
  spec.description   = "Compilers to help you get started building a new web site, web application or HTML email fast."
  spec.homepage      = "https://github.com/xxix/stencil"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ['stencil']
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'sassc'
  spec.add_dependency 'filewatcher'
  spec.add_dependency 'liquid'
  spec.add_dependency 'autoprefixer-rails'
  spec.add_dependency 'premailer'
  spec.add_dependency 'nokogiri', '>= 1.4.4'
  spec.add_dependency 'sass_paths'
  spec.add_dependency 'webrick'
  spec.add_dependency 'uglifier'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
