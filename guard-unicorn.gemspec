# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "guard/unicorn/version"

Gem::Specification.new do |s|
  s.name        = "guard-unicorn"
  s.version     = Guard::UnicornVersion::VERSION
  s.authors     = ["Jesse Cooke"]
  s.email       = ["jesse@jc00ke.com"]
  s.homepage    = "https://github.com/jc00ke/guard-unicorn"
  s.summary     = %q{Guard gem for unicorn}
  s.description = %q{Guard::Unicorn controls re/starting unicorn}

  s.rubyforge_project = "guard-unicorn"

  s.add_dependency 'guard', '~> 0.6.3'

  s.add_development_dependency 'bundler',         '~> 1.0.18'
  s.add_development_dependency 'rspec',           '~> 2.6.0'
  s.add_development_dependency 'guard-rspec',     '~> 0.4.5'
  s.add_development_dependency 'guard-bundler',   '~> 0.1.3'
  # Yeah, that's right, I develop on Linux. Get over it.
  s.add_development_dependency 'rb-inotify',      '~> 0.8.6'
  s.add_development_dependency 'libnotify',       '~> 0.5.7'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
