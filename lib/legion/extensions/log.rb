# frozen_string_literal: true

require 'legion/extensions/log/version'

module Legion
  module Extensions
    module Log
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core, false
    end
  end
end
