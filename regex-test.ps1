$rawtext = Get-Content -Path D:\UserList.txt

#$rawtext -match "\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b"

#$matches

$regex = [regex]"(?i)\b[A-Z0-9._%+-]+(?=\@)"
#$regex = [regex]"(?i)\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b"

$newusers = $regex.Matches($rawtext) | Select-Object -Property Value 







$newusers | ForEach-Object {  Add-ADGroupMember -Identity allmailusers -Members $_.value}
