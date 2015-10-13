def launch_in_parallel(config_file)
	system("parallel_rspec #{'-n ' + ENV['processes'] if ENV['processes']} --test-options
		'-r ./#{config_file} --order random' spec")
end

desc 'Run tests locally, by browser'
task :local, :browser do |t, args|
	ENV['browser'] = args[:browser]
	launch_in_parallel('config/local.rb')
end

desc "Run tests in Sauce"
task :cloud do
	launch_in_parallel('config/cloud.rb')
end

desc "Run tests in Sauce Connect"
task :cloud_tunnel do
	Dir.chdir('vendor/the-internet')
	process_id = Process.spawn('ruby server.rb')
	Dir.chdir('../..')
		ENV['tunnel'] = 'on'
		launch_in_parallel('config/cloud.rb')
	Process.kill("KILL", process_id)
end