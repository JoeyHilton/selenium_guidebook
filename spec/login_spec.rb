require_relative 'spec_helper'
require_relative '../pages/login'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe 'Login' do
	before(:each) do
		@login = Login.new(@driver)
	end

	it 'succeeded' do
		@login.with('tomsmith', 'SuperSecretPassword!')
		@login.success_message_present?.should be true
	end

	it 'failed' do
	@login.with('asdf', 'asdf')
	# @login.success_message_present?.should be false
	@login.failure_message_present?.should be true
	end
end