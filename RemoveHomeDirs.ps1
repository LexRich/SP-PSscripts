
$query = Get-ADUser -SearchBase 'OU=Testing,DC=net,DC=stroypark,DC=su' -Filter {Enabled -eq "False"}
$users = $query.SamAccountName | Tee-Object -f D:\dirs.txt
#$users = Get-ChildItem D:\Users
foreach ($user in $users){
    $userpath = "D:\Users\$user"
    
        Remove-Item "$userpath" -Force -Recurse -ErrorAction SilentlyContinue -WhatIf
    
}
