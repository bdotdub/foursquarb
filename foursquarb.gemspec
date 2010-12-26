# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "foursquarb/version"

Gem::Specification.new do |s|
  s.name        = "foursquarb"
  s.version     = Foursquarb::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Benny Wong']
  s.email       = ["benny@bwong.net"]
  s.homepage    = "http://github/bdotdub/foursquarb"
  s.summary     = "Rubygem to access Foursquare API"
  s.description = "Rubygem to access Foursquare API"

  s.rubyforge_project = "foursquarb"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "httparty", ">= 0.4.3"
  s.add_dependency "hashie", ">= 0.1.8"
  s.add_dependency "oauth2", ">= 0.1.0"
  s.add_dependency "yajl-ruby"
  s.add_dependency "multi_json"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec", "~>1.3.1"
end
