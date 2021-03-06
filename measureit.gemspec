# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'measureit/version'

Gem::Specification.new do |spec|
  spec.name          = 'measureit'
  spec.version       = Measureit::VERSION
  spec.authors       = ['Edgar Cabrera']
  spec.email         = ['edgar.cabrera@pm.me']

  spec.summary       = 'A simple playground for learning about ruby performance'
  spec.description   = 'Measureit is intended to be used as an educational tool in order to understand ruby performance'
  spec.homepage      = 'https://github.com/aleandros/measureit'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '~> 1.3'

  spec.add_dependency 'tty-table', '~> 0.12'
end
