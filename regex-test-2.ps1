$rawtext = Get-Content -Path D:\UserList.txt

#$rawtext -match "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b"

#$matches


$regex = [regex]"(?i)\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b"

$maillist = $regex.Matches($rawtext) | Select-Object -ExpandProperty Value 



#$ADLogins | ForEach-Object {  Get-ADUser -Identity * -Members $_.value}

foreach ($mail in $maillist)
    {
        $aduser = Get-ADUser  -Filter "mail -eq '$mail'" -Properties SamAccountName,mail | Select-Object SamAccountName
    }



$newusers | ForEach-Object {  Add-ADGroupMember -Identity allmailusers -Members $_.value}