# frozen_string_literal: true

require 'English'
require 'spec_helper'
require 'tmpdir'

# Stub the Helpers::Lex module that the runner includes at load time
module Legion
  module Extensions
    module Helpers
      module Lex; end
    end
  end
end
$LOADED_FEATURES << 'legion/extensions/helpers/lex'

require 'legion/extensions/log/runners/output'

RSpec.describe Legion::Extensions::Log::Runners::Output do
  let(:client) { Object.new.extend(described_class) }

  describe '#to_stdout' do
    before do
      allow(Legion::Logging).to receive(:info)
      allow(Legion::Logging).to receive(:debug)
      allow(Legion::Logging).to receive(:warn)
      allow(Legion::Logging).to receive(:error)
      allow(Legion::Logging).to receive(:fatal)
      allow(Legion::Logging).to receive(:unknown)
    end

    it 'delegates info level to Legion::Logging.info' do
      client.to_stdout(message: 'test message', level: 'info')
      expect(Legion::Logging).to have_received(:info).with('test message')
    end

    it 'delegates debug level to Legion::Logging.debug' do
      client.to_stdout(message: 'test message', level: 'debug')
      expect(Legion::Logging).to have_received(:debug).with('test message')
    end

    it 'delegates warn level to Legion::Logging.warn' do
      client.to_stdout(message: 'test message', level: 'warn')
      expect(Legion::Logging).to have_received(:warn).with('test message')
    end

    it 'delegates error level to Legion::Logging.error' do
      client.to_stdout(message: 'test message', level: 'error')
      expect(Legion::Logging).to have_received(:error).with('test message')
    end

    it 'delegates fatal level to Legion::Logging.fatal' do
      client.to_stdout(message: 'test message', level: 'fatal')
      expect(Legion::Logging).to have_received(:fatal).with('test message')
    end

    it 'delegates unknown level to Legion::Logging.unknown' do
      client.to_stdout(message: 'test message', level: 'unknown')
      expect(Legion::Logging).to have_received(:unknown).with('test message')
    end

    it 'defaults to info level' do
      client.to_stdout(message: 'test message')
      expect(Legion::Logging).to have_received(:info).with('test message')
    end

    it 'returns level and message' do
      result = client.to_stdout(message: 'hello', level: 'warn')
      expect(result).to eq({ level: 'warn', message: 'hello' })
    end
  end

  describe '#to_file' do
    let(:mock_logger) { instance_double(Legion::Logging::Logger) }
    let(:tmpfile) { File.join(Dir.tmpdir, "lex_log_test_#{$PROCESS_ID}.log") }

    before do
      allow(Legion::Logging::Logger).to receive(:new).and_return(mock_logger)
      allow(mock_logger).to receive(:info)
      allow(mock_logger).to receive(:debug)
      allow(mock_logger).to receive(:warn)
      allow(mock_logger).to receive(:error)
      allow(mock_logger).to receive(:fatal)
      allow(mock_logger).to receive(:unknown)
    end

    it 'creates a logger targeting the given location' do
      client.to_file(location: tmpfile, message: 'test')
      expect(Legion::Logging::Logger).to have_received(:new).with(log_file: tmpfile, level: 'debug')
    end

    it 'delegates info level to the file logger' do
      client.to_file(location: tmpfile, message: 'test', level: 'info')
      expect(mock_logger).to have_received(:info).with('test')
    end

    it 'delegates debug level to the file logger' do
      client.to_file(location: tmpfile, message: 'test', level: 'debug')
      expect(mock_logger).to have_received(:debug).with('test')
    end

    it 'delegates warn level to the file logger' do
      client.to_file(location: tmpfile, message: 'test', level: 'warn')
      expect(mock_logger).to have_received(:warn).with('test')
    end

    it 'delegates error level to the file logger' do
      client.to_file(location: tmpfile, message: 'test', level: 'error')
      expect(mock_logger).to have_received(:error).with('test')
    end

    it 'delegates fatal level to the file logger' do
      client.to_file(location: tmpfile, message: 'test', level: 'fatal')
      expect(mock_logger).to have_received(:fatal).with('test')
    end

    it 'delegates unknown level to the file logger' do
      client.to_file(location: tmpfile, message: 'test', level: 'unknown')
      expect(mock_logger).to have_received(:unknown).with('test')
    end

    it 'defaults to info level' do
      client.to_file(location: tmpfile, message: 'test')
      expect(mock_logger).to have_received(:info).with('test')
    end

    it 'returns message, level, and location' do
      result = client.to_file(location: tmpfile, message: 'hello', level: 'error')
      expect(result).to eq({ message: 'hello', level: 'error', location: tmpfile })
    end
  end
end
