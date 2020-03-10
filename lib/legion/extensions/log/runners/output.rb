# frozen_string_literal: true

module Legion::Extensions::Log
  module Runners
    module Output
      def self.to_file(location:, message:, level: 'info', **opts); end

      def self.to_stdout(message:, level: 'info', **_opts)
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
        { success: true, level: level }
      end

      include Legion::Extensions::Helpers::Lex
    end
  end
end
