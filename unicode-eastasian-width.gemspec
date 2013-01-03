# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'unicode-eastasian-width/version'

Gem::Specification.new do |gem|
  gem.name          = "unicode-eastasian-width"
  gem.version       = Unicode::Eastasian::Width::VERSION
  gem.authors       = ["USAMI Kenta"]
  gem.email         = ["tadsan@zonu.me"]
  gem.description   = %q{So what if it's library for East Asian Width Propaties?}
  gem.summary       = %q{If you don't know the Hanzi (Chinese Charactor) and CJK Charactors, you may not know that there is letters displayed by double width in console. `EastAsianWidth.txt` give the definition of width of Unicode letters. This gem provide means to easily access to `EastAsianWidth.txt`.

I want to find happiness. *The happy world* is the world where we can handle the letter of the native language without a hindrance with a console.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
