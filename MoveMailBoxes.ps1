$Targetdb = "Top"
$batchNAme = Get-Date -Format yyyyMMdd

$MailBoxesToMove = Get-Content  D:\dirs.txt

$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri http://hp.net.stroypark.su/powershell `
                         -Authentication Kerberos

Import-PSSession $session

Write-Host "Создаю запрос на перемещение"

foreach ($SingleMailbox in $MailBoxesToMove){

        Write-Host "Move" $SingleMailbox"@stroypark.su"    
        New-MoveRequest -Identity $SingleMailbox -TargetDatabase $Targetdb -BadItemLimit 200 -BatchName $BatchName -AcceptLargeDataLoss
    
}

Write-Host "Перемещаю ящики в базу Unused"

$i=1

while ((Get-MoveRequest -BatchName $BatchName | Where-Object {($_.Status -eq “Queued”) -or ($_.Status -eq “InProgress”)})) {
    Start-Sleep -s 60
    Write-Host "Скрипт работает $i минут. Ожидаем завершения.."
    $i=$i+1
}

Write-Host "Все ящики перемещены."

Start-Sleep -s 15

Write-Host "Очищаю запросы на перемещение"

Get-MoveRequest -BatchName $BatchName -MoveStatus Completed | Remove-MoveRequest -Confirm:$false

Write-Host "Запросы на перемещение очищены"
Write-Host "Завершение работы скрипта...."

Start-Sleep -s 30

Remove-PSSession $session
