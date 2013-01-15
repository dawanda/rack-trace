# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name        = "rack-trace"
  s.version     = "0.0.1"
  s.date        = Date.today.to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Paul Asmuth"]
  s.email       = ["paul@paulasmuth.com"]
  s.homepage    = "http://github.com/paulasmuth/rack-trace"
  s.summary     = %q{fnord}
  s.description = %q{fnord}
  s.licenses    = ["MIT"]

  s.add_dependency "redis", ">= 2.2.2"

  s.files         = `git ls-files`.split("\n") - [".gitignore", ".rspec", ".travis.yml"]
  s.test_files    = `git ls-files -- spec/*`.split("\n")
  s.require_paths = ["lib"]
end
