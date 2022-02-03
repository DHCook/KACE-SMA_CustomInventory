$Events = Get-WinEvent -FilterHashtable @{LogName='System'; ProviderName='Microsoft-Windows-WER-SystemErrorReporting'; Id=1001; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue
If ($Events) {
    ForEach ($Event in $Events) {
        $eventXML = [xml]$Event.ToXml()
        Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  Bugcheck -Value ($eventXML.Event.EventData.Data[0].'#text' -replace "\s\(.*","")
        Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  DumpFile -Value $eventXML.Event.EventData.Data[1].'#text'
    }
    $Events | Format-List TimeCreated,Bugcheck,DumpFile
}