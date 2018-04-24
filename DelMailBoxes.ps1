#Создание подключения (сессии) к серверу MS Exchange

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://hp.net.stroypark.su/powershell `
                         -Authentication Kerberos  -Credential (Get-Credential) # -Credential (Get-Credential) запрашивает креды в отдельном окне

Import-PSSession $session -DisableNameChecking

# Далее ожно вводить команды Exchange Managment Shell

# Get-ExchangeServer

# Разрыв сессии

Remove-PSSession $session