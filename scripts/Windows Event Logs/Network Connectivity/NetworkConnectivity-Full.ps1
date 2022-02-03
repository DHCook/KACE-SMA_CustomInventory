# Query Windows Event Log for entries regarding network connections
$Logs = Get-WinEvent -FilterHashTable @{LogName='Microsoft-Windows-NetworkProfile/Operational'; ID=10000,10001 ; StartTime=((Get-Date) - (New-TimeSpan -Day 7))} -ErrorAction SilentlyContinue

# Check if there are any logs
if ($Logs) {
    $Logs | 
    # Filter the logs to only look at Disconnected and Connected but not Connected and identifying
    Where-Object {$_.Message -cmatch "Disconnected" -or $_.Message -cmatch "Connected" -and $_.Message -notmatch "Identifying"} | `
    # Select only the relevant information
    Select-Object TimeCreated,@{
        Name="Status";Expression={
            if ($_.Message -cmatch "Disconnected") {
                "Disconnected"
            } elseif ($_.Message -cmatch "Connected" -and $_.Message -notmatch "Identifying...") {
                "Connected"
            }
        }
    } | `
    # Format as list, grouping by date 
    Format-List -GroupBy @{Expression={$_.TimeCreated.Date.ToShortDateString()};Name="Date"}
}