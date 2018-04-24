$query = Get-ADUser -SearchBase 'OU=Testing,DC=net,DC=stroypark,DC=su' -Filter {Enabled -eq "False"}
$users = $query.SamAccountName | Tee-Object -f D:\dirs.txt

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://hp.net.stroypark.su/powershell `
                         -Authentication Kerberos  -Credential

Import-PSSession $session -DisableNameChecking