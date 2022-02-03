$Events = Get-WinEvent -FilterHashTable @{LogName='System'; Level=1,2; ID=6008; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue
If ($Events) {
    ForEach ($Event in $Events) {
        $eventXML = [xml]$Event.ToXml()
        Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  ShutdownTime -Value $eventXML.Event.EventData.Data[0]
        Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  ShutdownDate -Value ([RegEx]::Replace($eventXML.Event.EventData.Data[1], '\P{IsBasicLatin}', ''))
    }
    $Events | Format-List @{Expression={$_.ShutdownDate, $_.ShutdownTime -join " "};Label="Shutdown"}, @{Expression={$_.TimeCreated};Label="Boot Time"}
}