# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicode-eastasianwidth/version'

Gem::Specification.new do |gem|
  gem.name          = "unicode-eastasianwidth"
  gem.version       = Unicode::EastAsianWidth::VERSION
  gem.authors       = ["USAMI Kenta"]
  gem.email         = ["tadsan@zonu.me"]
  gem.description   = "EastAsianWidth.txt parser and converter"
  gem.summary       = "Get ruby object from EastAsianWidth.txt"
  gem.homepage      = "http://dt.zonu.me/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
