require_relative 'dynamic_loading'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe 'Dynamic Loading' do 

	before(:each) do 
		@driver = Selenium::WebDriver.for :firefox
		ENV['base_url'] = 'http://the-internet.herokuapp.com'
		@dynamic_loading = DynamicLoading.new(@driver)
	end

	after(:each) do 
		@driver.quit
	end

	it 'Example 1: Hidden Element' do 
		@dynamic_loading.example 1
		@dynamic_loading.start
		@dynamic_loading.finish_text_present?.should be true
	end

	it 'Example 2: Rendered after the fact' do 
		@dynamic_loading.example 2
		@dynamic_loading.start
		@dynamic_loading.finish_text_present?.should be true
	end
	
end