# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cologne_phonetics/version'

Gem::Specification.new do |spec|
  spec.name          = 'cologne_phonetics'
  spec.version       = ColognePhonetics::VERSION
  spec.authors       = ['Stefan Daschek']
  spec.email         = ['stefan@die-antwort.eu']

  spec.summary       = 'Cologne phonetics (Kölner Phonetik) text encoding algorithm'
  spec.description   = 'The Cologne phonetics (also Kölner Phonetik, Cologne process) algorithm encodes ' \
                       'words in a way that enables to search for similarly sounding words. It’s related '\
                       'to Soundex and Metaphone, but better suited for the German language.'
  spec.homepage      = 'https://github.com/die-antwort/cologne_phonetics'
  spec.license       = 'MIT'

  spec.files         = Dir['{lib}/**/*', 'CHANGELOG.md', 'LICENSE.txt', 'README.md']
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}){ |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.6'
  spec.add_development_dependency 'rubocop', '~> 0.52.1'
  spec.add_development_dependency 'yard', '~> 0.9.12'
end
