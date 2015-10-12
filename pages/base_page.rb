require 'selenium-webdriver'

class BasePage
	def initialize(driver)
		@driver = driver
	end
	def visit(url_path)
		@driver.get ENV['base_url'] + url_path
	end
	def find(locator)
		@driver.find_element locator
	end
	def type(text, locator)
		find(locator).send_keys text
	end
	def submit(locator)
		find(locator).submit
	end
	def is_displayed?(locator)
		begin
			find(locator).displayed?
		rescue Selenium::WebDriver::Error::NoSuchElementError
			false
		end
	end

	def click(locator)
		find(locator).click
	end

	def wait_for(seconds = 15)
		Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
	end
	
end