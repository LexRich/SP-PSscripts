$UsersList1 = Get-Content -Path D:\list1.txt
$UsersList2 = Get-Content -Path D:\list2.txt

$UsersList1 | Select-String $UsersList2 -SimpleMatch -NotMatch
