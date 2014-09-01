# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "luna/version"

Gem::Specification.new do |s|
  s.name        = "luna"
  s.version     = Luna::Version
  s.platform    = Gem::Platform::RUBY
  s.licenses    = ["MIT"]
  s.summary     = "Facilitar integração com o Luna Door"
  s.email       = "rubin.diego@gmail.com"
  s.homepage    = "http://diegorubin.com/projects/luna"
  s.description = "Facilitar integração com o Luna Door"
  s.authors     = ['Diego Rubin']

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  s.files += %w(Gemfile README.md)
  s.files << "luna.gemspec"

  s.test_files = Dir["spec/**/*"]

  s.add_dependency("rails", "~> 4.0.0")
  s.add_dependency("oauth2", "0.9.3")
  s.add_dependency("faraday_middleware")
  s.add_dependency("figaro", "~> 0.7.0")
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'factory_girl_rails'
end

