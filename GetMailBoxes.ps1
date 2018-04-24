#Выборка ящиков в базе Unused где дата последнего доступа пустая и имя не начинается с System* в Exchange Shell 2010

Get-MailboxDatabase Unused | Get-MailboxStatistics  | Where-Object {$_.lastlogontime -eq $null -AND $_.DisplayName -notmatch "System*"} | 
Select-Object displayname,lastlogontime, itemcount, mailboxguid

#Выборка ящиков в базе Unused где дата последнего доступа пустая и имя не начинается PowerShell 5.1 (Удаленно Exchange 2010), вывод Alias каждого ящика

$mailBoxes = Get-MailboxStatistics -Database Unused  | Where-Object {$_.lastlogontime -eq $null -AND $_.DisplayName -notmatch "System*"} | Get-Mailbox
$mailboxes.Alias | Tee-Object -f D:\aliases.txt

$mailBoxes = Get-MailboxStatistics -Database Unused  -Filter {lastlogontime -eq $null -AND DisplayName -notmatch "System*"} | Get-Mailbox
$mailboxes.Alias | Tee-Object -f D:\aliases2.txt