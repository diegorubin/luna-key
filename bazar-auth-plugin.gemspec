# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bazar/version"

Gem::Specification.new do |s|
  s.name        = "bazar-auth-plugin"
  s.version     = Bazar::VERSION
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Facilitar integração com o Bazar Oauth"
  s.email       = "rubin.diego@gmail.com"
  s.homepage    = "http://diegorubin.com/projects/bazar"
  s.description = "Facilitar integração com o Bazar Oauth"
  s.authors     = ['Diego Rubin']

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_dependency("rails", "~> 4.0.0")
  s.add_dependency("oauth2", "0.9.3")
end

