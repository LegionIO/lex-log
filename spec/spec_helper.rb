# frozen_string_literal: true
require 'simplecov'
SimpleCov.start

require 'rspec'
require 'bundler/setup'
require 'legion/logging'
require 'legion/extensions/log'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.expect_with(:rspec) { |c| c.syntax = :expect }
end
