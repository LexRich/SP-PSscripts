
$query = Get-ADUser -SearchBase 'OU=Testing,DC=net,DC=stroypark,DC=su' -Filter {Enabled -eq "False"}
$users = $query.SamAccountName | Tee-Object -f D:\dirs.txt
#$users = Get-ChildItem D:\Users
foreach ($user in $users){
    $userpath = "D:\Users\$user"
    
        Remove-Item "$userpath" -Force -Recurse -ErrorAction SilentlyContinue -WhatIf
    
}
<<<<<<< HEAD:DelHomeDirs.ps1

$password = Get-Content .\password.txt
$password = $password | ConvertTo-SecureString

Import-Module posh-ssh

$credential = New-Object System.Management.Automation.PSCredential "admin", $password

New-SSHSession -ComputerName 192.168.0.20 -Credential $credential -AcceptKey $true
Invoke-SSHCommand -Index 0 -Command "cd /share/MD0_DATA/homes/DOMAIN=SP; ./test.sh $users"

Remove-SSHSession -Index 0
=======
>>>>>>> aecc52a039a6fe957ebd6faba3f672806a472373:RemoveHomeDirs.ps1
