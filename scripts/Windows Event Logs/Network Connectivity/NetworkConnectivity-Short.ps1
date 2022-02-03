Get-WinEvent -FilterHashTable @{LogName='Microsoft-Windows-NetworkProfile/Operational'; ID=10000,10001 ; StartTime=((Get-Date) - (New-TimeSpan -Day 7))} -ErrorAction SilentlyContinue | ?{$_.Message -cmatch "Disconnected" -or $_.Message -cmatch "Connected" -and $_.Message -notmatch "Identifying"} | fl -p TimeCreated,@{Name="Status";Expression={if ($_.Message -cmatch "Disconnected") {"Disconnected"} elseif ($_.Message -cmatch "Connected" -and $_.Message -notmatch "Identifying...") {"Connected"}}} -g @{Expression={$_.TimeCreated.Date.ToShortDateString()};Name="Date"}