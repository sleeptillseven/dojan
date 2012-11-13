# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dojan/version'

Gem::Specification.new do |gem|
  gem.name          = "dojan"
  gem.version       = Dojan::VERSION
  gem.authors       = ["Christoph Jasinski"]
  gem.email         = ["christoph.jasinski@googlemail.com"]
  gem.description   = %q{A fake FTP server which aims to help you have clean tests.}
  gem.summary       = %q{Testing FTP calls without pain}
  gem.homepage      = "http://sleeptillseven.github.com/dojan/"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
