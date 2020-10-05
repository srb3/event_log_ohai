win_temp_directory = inspec.command("echo $env:TEMP").stdout.strip
plugin_directory   = "#{win_temp_directory}/kitchen/ohai/cookbook_plugins/event_log_ohai"
plugin_name        = 'event_log'

describe command("ohai -d #{plugin_directory} #{plugin_name}") do
  its(:stdout) { should include 'netprofm' }
end
