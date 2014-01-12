# -*- encoding: utf-8 -*-
$:.push File.expand_path "../lib", __FILE__
require "ruby-life/version"

Gem::Specification.new do |s|
  s.name          = "ruby-life"
  s.version       = RubyLife::VERSION
  s.platform      = Gem::Platform::RUBY
  s.author        = ["R Alex Stokes"]
  s.email         = [""]
  s.homepage      = "http://alex.stokes.io"
  s.summary       = "Conway's Game of Life, in Ruby"
  s.description   = "http://en.wikipedia.org/wiki/Conway's_Game_of_Life"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths = ['lib']
end