# -*- encoding: utf-8 -*-
require File.expand_path('../lib/net_http_timeout_errors/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Henrik Nyh"]
  gem.email         = ["henrik@nyh.se"]
  gem.summary       = %q{Provides a list of Net::HTTP timeout errors.}
  gem.homepage      = "https://github.com/barsoom/net_http_timeout_errors"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "net_http_timeout_errors"
  gem.require_paths = ["lib"]
  gem.version       = NetHttpTimeoutErrors::VERSION

  if RUBY_VERSION < "1.9.3"
    gem.add_development_dependency "minitest"
  end
end
