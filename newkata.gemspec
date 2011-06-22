# -*- encoding: utf-8 -*-
$:.push File.expand_path("lib", File.dirname(__FILE__))
require "newkata/version"

Gem::Specification.new do |s|
  s.name        = "newkata"
  s.version     = Newkata::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Arnaud Meuret"]
  s.email       = ["arnaud@meuret.name"]
  s.homepage    = "https://github.com/ameuret/newkata"
  s.summary     = %q{Generate a simple Ruby project hierarchy perfect for code katas.}
  s.description = %q{A simple project generator, handy to tryout a new class with a corresponding (r)spec.}

  s.rubyforge_project = "newkata"
  
  s.add_dependency "thor"
  s.add_dependency "guard"
  s.add_dependency "rb-inotify"
  s.add_dependency "rspec"
  s.add_dependency "guard-rspec"
  s.add_dependency "libnotify"
  
  # dev gems are better managed directly by the Gemfile
  #  s.add_development_dependency ""

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
