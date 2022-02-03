$CBSRebootPend = (Get-ChildItem "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Component Based Servicing").PSChildName -contains "RebootPending"
$RegValuePFRO = (Get-ItemProperty "HKLM:\SYSTEM\CurrentControlSet\Control\Session Manager").PendingFileRenameOperations
If ($RegValuePFRO) {$PendFileRename = $true}
# $KACEReboot = (Get-ChildItem "C:\ProgramData\Quest\KACE\user").Name -contains "KACEPATCH_REBOOT_PENDING"
$RebootPending = ($CBSRebootPend -or $PendFileRename -or $KACEReboot)
Write-Host "Reboot Pending :"$RebootPending `n"Windows Update : "$CBSRebootPend `n"KACE Patching  : "$KACEReboot`n"Pending Rename : "$PendFileRename$RegValuePFRO