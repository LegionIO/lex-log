# frozen_string_literal: true

require_relative 'lib/legion/extensions/log/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-log'
  spec.version       = Legion::Extensions::Log::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'Used to generate logs within the Legion framework'
  spec.description   = 'It logs things'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-log'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-log/src'
  spec.metadata['changelog_uri'] = 'https://bitbucket.org/legion-io/lex-log/src/master/CHANGELOG.md'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'legionio'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec_junit_formatter'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'simplecov', '< 0.18.0'

  spec.add_dependency 'legion-logging'
end
