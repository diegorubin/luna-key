# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bazar/version"

Gem::Specification.new do |s|
  s.name        = "bazar"
  s.version     = Bazar::Version
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Facilitar integração com o Bazar Oauth"
  s.email       = "rubin.diego@gmail.com"
  s.homepage    = "http://diegorubin.com/projects/bazar"
  s.description = "Facilitar integração com o Bazar Oauth"
  s.authors     = ['Diego Rubin']

  s.files = %w(Gemfile README.md)
  s.files << "bazar.gemspec"
  s.files += Dir.glob("lib/**/*.rb")

  s.test_files    = `git ls-files -- spec/*`.split("\n")

  s.add_dependency("rails", "~> 4.0.0")
  s.add_dependency("oauth2", "0.9.3")
  s.add_dependency("faraday_middleware")
  s.add_dependency("figaro", "~> 0.7.0")
end

