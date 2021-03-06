
# frozen_string_literal: true

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'little_sax/version'

Gem::Specification.new do |spec|
  spec.name          = 'little_sax'
  spec.version       = LittleSax::VERSION
  spec.authors       = ['James Pinto']
  spec.email         = ['thejamespinto@gmail.com']

  spec.summary       = 'Little Sax reads huge XML documents with almost no RAM.'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/thejamespinto/little_sax'
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'colorize'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
