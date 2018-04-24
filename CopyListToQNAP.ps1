$password = Get-Content .\password.txt

$password = $password | ConvertTo-SecureString

Import-Module posh-ssh

$credential = New-Object System.Management.Automation.PSCredential "admin", $password

New-SSHSession -ComputerName 192.168.0.20 -Credential $credential
