$user = Get-Credential
 
$user.Password | ConvertFrom-SecureString | Tee-Object .\password.txt


