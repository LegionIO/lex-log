# frozen_string_literal: true

require 'legion/logging/logger'

module Legion::Extensions::Log
  module Runners
    module Output
      def to_file(location:, message:, level: 'info', **_opts)
        logger = Legion::Logging::Logger.new(log_file: location, level: 'debug')
        if level == 'debug'
          logger.debug message
        elsif level == 'warn'
          logger.warn message
        elsif level == 'error'
          logger.error message
        elsif level == 'fatal'
          logger.fatal message
        elsif level == 'unknown'
          logger.unknown message
        else
          logger.info message
        end

        { message: message, level: level, location: location }
      end

      def to_stdout(message:, level: 'info', **_opts)
        if level == 'debug'
          Legion::Logging.debug message
        elsif level == 'warn'
          Legion::Logging.warn message
        elsif level == 'error'
          Legion::Logging.error message
        elsif level == 'fatal'
          Legion::Logging.fatal message
        elsif level == 'unknown'
          Legion::Logging.unknown message
        else
          Legion::Logging.info message
        end
        { level: level, message: message }
      end

      include Legion::Extensions::Helpers::Lex
    end
  end
end
