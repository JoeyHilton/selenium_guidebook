require_relative 'base_page'

class DynamicLoading < BasePage 

	START_BUTTON = { id: 'start' }
	FINISH_TEXT = { id: 'finish'}

	def initialize(driver)
		super
		visit '/dynamic_loading/1'
	end

	def start
		click START_BUTTON
	end

	def finish_text_present?
		wait_for(10) {is_displayed? FINISH_TEXT}
	end
end