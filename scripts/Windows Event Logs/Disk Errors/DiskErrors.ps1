$diskErr = Get-WinEvent -FilterHashtable @{LogName='System'; ProviderName='disk'; ID=7; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue
if ($diskErr) {
    $diskErr | Group-Object {$_.TimeCreated.Date} | Format-List @{Name="Date";Expression={$_.Name}},@{Name="Error";Expression={$_.Count}}
    Write-Output "Total:"
    $diskErr.Count
}