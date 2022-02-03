$Logs = Get-WinEvent -FilterHashtable @{LogName='Application'; Id=6006; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue
If ($Logs) {
ForEach ($Log in $Logs) {
$logXML = [xml]$Log.ToXml()
Add-Member -InputObject $Log -MemberType NoteProperty -Force -Name Subscriber -Value $logXML.Event.EventData.Data[0]
Add-Member -InputObject $Log -MemberType NoteProperty -Force -Name Delay -Value ([int]$logXML.Event.EventData.Data[1])
Add-Member -InputObject $Log -MemberType NoteProperty -Force -Name Event -Value $logXML.Event.EventData.Data[2]

}
$Logs | Where-Object {$_.Subscriber -eq 'GPClient' -and $_.Delay -gt '120'} | Format-List @{Name="Time";Expression={$_.TimeCreated}},Delay,Event
}