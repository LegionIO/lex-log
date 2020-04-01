# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Log do
  it 'has a version number' do
    expect(Legion::Extensions::Log::VERSION).not_to be nil
  end

  it { should be_a Legion::Extensions::Core }
  it { should respond_to :autobuild }
end
