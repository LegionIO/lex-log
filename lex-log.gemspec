# frozen_string_literal: true

require_relative 'lib/legion/extensions/log/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-log'
  spec.version       = Legion::Extensions::Log::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'Used to generate logs within the Legion framework'
  spec.description   = 'A LegionIO Extension to log to STDOUT and to files in an async fashion'
  spec.homepage      = 'https://github.com/LegionIO/lex-log'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LegionIO/lex-logsrc'
  spec.metadata['documentation_uri'] = 'https://github.com/LegionIO/lex-log'
  spec.metadata['changelog_uri'] = 'https://github.com/LegionIO/lex-log'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/LegionIO/lex-log/issues'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.require_paths = ['lib']
  spec.add_dependency 'legion-logging'

  spec.add_development_dependency 'legionio'
end
