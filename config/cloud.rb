require 'sauce_whisk'

ENV['base_url'] 					||= 'http://the-internet.herokuapp.com'
ENV['host'] 						  = 'saucelabs'
ENV['operating_system'] 	||= 'Windows XP'
ENV['browser'] 						||= 'internet_explorer'
ENV['browser_version'] 		||= '8'
ENV['SAUCE_USERNAME'] 		= 'shnek81'
ENV['SAUCE_ACCESS_KEY']		= '7f605afa-d061-4937-b035-6125107af4e3'
ENV['tunnel'] 						||= ''

unless ENV['tunnel'].empty?
	require 'sauce'
	Sauce::Utilities::Connect.start
	ENV['base_url'] 				= 'http://the-internet-local:4567'
end