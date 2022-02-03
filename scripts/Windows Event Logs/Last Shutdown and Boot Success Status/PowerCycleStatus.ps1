$Events = Get-WinEvent -FilterHashTable @{LogName='System'; ProviderName='Microsoft-Windows-Kernel-Boot'; ID=20; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue
If ($Events) {
    ForEach ($Event in $Events) {
        $eventXML = [xml]$Event.ToXml()
        Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  "Shutdown Success" -Value $eventXML.Event.EventData.Data[0].'#text'
        Add-Member -InputObject $Event -MemberType NoteProperty -Force -Name  "Boot Success" -Value $eventXML.Event.EventData.Data[1].'#text'
    }
    $Events | Format-LIst TimeCreated,"Shutdown Success","Boot Success"
}