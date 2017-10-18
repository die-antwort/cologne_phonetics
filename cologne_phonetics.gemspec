# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "cologne_phonetics/version"

Gem::Specification.new do |spec|
  spec.name          = "cologne_phonetics"
  spec.version       = ColognePhonetics::VERSION
  spec.authors       = ["Stefan Daschek"]
  spec.email         = ["stefan@die-antwort.eu"]

  spec.summary       = %q{Cologne phonetics (Kölner Phonetik) text encoding algorithm}
  spec.description   = %q{Cologne phonetics (also Kölner Phonetik, Cologne process) is a phonetic algorithm which assigns to words a sequence of digits, the phonetic code.}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = Dir["{bin,lib}/**/*", ".gitignore", ".rspec", "Gemfile", "LICENSE.txt", "README.md", "Rakefile"]
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.6"
end
