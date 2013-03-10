# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicode-eastasianwidth/version'

Gem::Specification.new do |spec|
  spec.name          = 'unicode-eastasianwidth'
  spec.version       = Unicode::EastAsianWidth::VERSION
  spec.authors       = ['USAMI Kenta']
  spec.email         = ['tadsan@zonu.me']
  spec.description   = 'EastAsianWidth.txt parser and converter'
  spec.summary       = 'Get ruby object from EastAsianWidth.txt'
  spec.homepage      = 'http://dt.zonu.me/'
  spec.license       = 'GPL Version 3 or NYSL'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_dependency 'io-access_lazy'
end
