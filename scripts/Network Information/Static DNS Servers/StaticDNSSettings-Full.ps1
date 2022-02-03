# Get all network adapters
Get-NetAdapter | `
# That are currently active
Where-Object {$_.Status -eq "up"} | `
# Get thir IP address information
Get-NetIPInterface -AddressFamily IPv4 | `
# Only concerned with Static addresses
Where-Object {$_.Dhcp -eq "Disabled"} | `
# Get the DNS configuration for the interface
Get-DnsClientServerAddress -AddressFamily IPv4 | `
# Only return the DNS Server Addresses
Select-Object -ExpandProperty ServerAddresses