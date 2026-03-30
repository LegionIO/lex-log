# frozen_string_literal: true

require 'legion/logging/logger'

module Legion
  module Extensions
    module Log
      module Runners
        module Output
          def to_file(location:, message:, level: 'info', **_opts)
            logger = Legion::Logging::Logger.new(log_file: location, level: 'debug')
            case level
            when 'debug'
              logger.debug message
            when 'warn'
              logger.warn message
            when 'error'
              logger.error message
            when 'fatal'
              logger.fatal message
            when 'unknown'
              logger.unknown message
            else
              logger.info message
            end

            { message: message, level: level, location: location }
          end

          def to_stdout(message:, level: 'info', **_opts)
            case level
            when 'debug'
              Legion::Logging.debug message # rubocop:disable Legion/HelperMigration/DirectLogging
            when 'warn'
              Legion::Logging.warn message # rubocop:disable Legion/HelperMigration/DirectLogging
            when 'error'
              Legion::Logging.error message # rubocop:disable Legion/HelperMigration/DirectLogging
            when 'fatal'
              Legion::Logging.fatal message # rubocop:disable Legion/HelperMigration/DirectLogging
            when 'unknown'
              Legion::Logging.unknown message
            else
              Legion::Logging.info message # rubocop:disable Legion/HelperMigration/DirectLogging
            end
            { level: level, message: message }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
