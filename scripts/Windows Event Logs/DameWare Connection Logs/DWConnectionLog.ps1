# Query Windows Event Logs and extract just the Message
[string]$connections = (Get-WinEvent -FilterHashTable @{LogName='Application'; ID=111; StartTime=((Get-Date) - (New-TimeSpan -Day 30))} -ErrorAction SilentlyContinue).Message

# Check if any logs matched the criteria
If ($connections) {
    ForEach ($connection in $connections) {
        # Extract important information and make human readable
        $connection -split "\n" -match "^Date|^Desktop User|^User|^Computer Name|^Peer IP" -replace "Date","$([char]0x000A)Sesstion Time" -replace "Computer Name","Admin Console" -replace "^User ID","Admin User   " -replace "Peer IP Address","Admin IP     " -replace "Desktop User ID","Desktop User "
    }
}