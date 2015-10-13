def launch_in_parallel(config_file)
	system("parallel_rspec #{'-n ' + ENV['processes'] if ENV['processes']} --test-options
		'-r ./#{config_file} --order random' spec")
end

namespace :local do
	desc 'Run tests in Firefox'
	task :firefox do
		ENV['browser'] = 'firefox'
		launch_in_parallel('config/local.rb')
	end
	desc 'Run tests in Chrome'
	task :chrome do
		ENV['browser'] = 'chrome'
		launch_in_parallel('config/local.rb')
	end
end

namespace :cloud do

	desc "Run tests in IE, by OS and version"
	task :ie, :version, :os do |t, args|
		ENV['browser'] = 'internet_explorer'
		ENV['browser_version'] = args[:version]
		ENV['operating_system'] = args[:os]
		launch_in_parallel('config/cloud.rb')
	end

	desc "Run tests in Firefox"
	task :firefox, :version, :os do |t, args|
		ENV['browser'] = 'firefox'
		ENV['browser_version'] = args[:version]
		ENV['operating_system'] = args[:os]
		launch_in_parallel('config/cloud.rb')
	end
	desc "Run tests in Chrome"
	task :chrome, :version, :os do |t, args|
		ENV['browser'] = 'chrome'
		ENV['browser_version'] = args[:version]
		ENV['operating_system'] = args[:os]
		launch_in_parallel('config/cloud.rb')
	end
	desc "Run tests against local app in Sauce Connect"
	task :tunnel, :browser, :version, :os do |t, args|
		ENV['browser'] = args[:browser]
		ENV['browser_version'] = args[:version]
		ENV['operating_system'] = args[:os]
		Dir.chdir('vendor/the-internet')
		process_id = Process.spawn('ruby server.rb')
		Dir.chdir('../..')
		ENV['tunnel'] = 'on'
		launch_in_parallel('config/cloud.rb')
		Process.kill("KILL", process_id)
	end
end
