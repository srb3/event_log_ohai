Ohai.plugin(:EventLog) do

  provides 'event_log'

  def service_command
    [
      'Get-Service -Name "EventLog" |',
      'Select-Object -ExpandProperty DependentServices |',
      'Where-Object Status -eq "Running" |',
      'Select-Object -ExpandProperty Name',
    ].join(' ')
  end
  
  def powershell_command
    ['powershell.exe',
      '-NoLogo',
      '-NonInteractive',
      '-NoProfile',
      '-Command',
    ].join(' ')
  end

  collect_data(:windows) do

    event_log Mash.new
    s = []
    so = shell_out("#{powershell_command} \"#{service_command}\"")

    if so.exitstatus == 0
      so.stdout.strip.each_line do |line|
        s << line.strip
      end
    end
    event_log[:dependent_services] = s
  end
end
