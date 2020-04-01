# frozen_string_literal: true

require 'spec_helper'
require 'legion/extensions/log'
require_relative '../../../lib/legion/extensions/log/runners/output'

RSpec.describe Legion::Extensions::Log::Runners::Output do
  before(:all) do
    Legion::Logging.setup(level: 'debug')
  end

  it { should respond_to(:to_file).with_keywords(:location, :message, :level) }
  it { should respond_to(:to_stdout).with_keywords(:message, :level) }

  let(:log) { Legion::Extensions::Log::Runners::Output }
  let(:location) { './rspec_test.log' }
  it 'can handle to_file' do
    expect { log.to_file(message: 'test', level: 'info', location: location) }.not_to raise_exception
    expect { log.to_file(message: 'test', level: 'unknown', location: location) }.not_to raise_exception
    expect { log.to_file(message: 'test', level: 'debug', location: location) }.not_to raise_exception
    expect { log.to_file(message: 'test', level: 'warn', location: location) }.not_to raise_exception
    expect { log.to_file(message: 'test', level: 'error', location: location) }.not_to raise_exception
    expect { log.to_file(message: 'test', level: 'fatal', location: location) }.not_to raise_exception
  end
  it 'can handle to_stdout' do
    expect { log.to_stdout(message: 'test', level: 'info') }.not_to raise_exception
  end

  describe '.to_stdout' do
    it 'info' do
      expect { log.to_stdout(message: 'test', level: 'info') }.to output(/INFO/).to_stdout_from_any_process
    end

    it 'debug' do
      expect { log.to_stdout(message: 'test', level: 'debug') }.to output(/DEBUG/).to_stdout_from_any_process
    end

    it 'warn' do
      expect { log.to_stdout(message: 'test', level: 'warn') }.to output(/WARN/).to_stdout_from_any_process
    end

    it 'error' do
      expect { log.to_stdout(message: 'test', level: 'error') }.to output(/ERROR/).to_stdout_from_any_process
    end

    it 'fatal' do
      expect { log.to_stdout(message: 'test', level: 'fatal') }.to output(/FATAL/).to_stdout_from_any_process
    end

    it 'unknown' do
      expect { log.to_stdout(message: 'test', level: 'unknown') }.to output(/ANY/).to_stdout_from_any_process
    end
  end
end
