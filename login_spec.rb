require 'selenium-webdriver'

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end

describe 'Login' do

	before(:each) do 
		@driver = Selenium::WebDriver.for :firefox
	end
	
	after(:each) do
		@driver.quit 
	end

	it 'succeeded' do 
		@driver.get 'http://the-internet.herokuapp.com/login'
		@driver.find_element(id: 'username').send_keys('tomsmith')
		@driver.find_element(id: 'password').send_keys('SuperSecretPassword!')
		@driver.find_element(id: 'login').submit
		@driver.find_element(css: '.flash.success').displayed?.should be true
	end

end