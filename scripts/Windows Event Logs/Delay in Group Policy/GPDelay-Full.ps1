# Query Windows Event Log for entries regarding Group Policy delays
$Logs = Get-WinEvent -FilterHashtable @{LogName='Application'; Id=6006; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue

# Check if there are any logs
If ($Logs) {
    # If there are, cycle through them
    ForEach ($Log in $Logs) {
        # Pull the important information
        $logXML = [xml]$Log.ToXml()
        Add-Member -InputObject $Log -MemberType NoteProperty -Force -Name Subscriber -Value $logXML.Event.EventData.Data[0]
        Add-Member -InputObject $Log -MemberType NoteProperty -Force -Name Delay -Value ([int]$logXML.Event.EventData.Data[1])
        Add-Member -InputObject $Log -MemberType NoteProperty -Force -Name Event -Value $logXML.Event.EventData.Data[2]

    }
    # I filter the output to only show delays greater than 120 seconds (2 minutes). Already a long period of time but acceptable.
    $Logs | Where-Object {$_.Subscriber -eq 'GPClient' -and $_.Delay -gt '120'} | Format-List @{Name="Time";Expression={$_.TimeCreated}},Delay,Event
}