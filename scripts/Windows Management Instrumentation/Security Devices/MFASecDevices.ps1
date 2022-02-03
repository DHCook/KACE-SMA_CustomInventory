# Pull a list of all PNP Devices on the system
$pnpDevs = Get-PnpDevice

# Search for Smart Cards, Fingerprint readers, Facial recognition, and NFC. Return True if found or False if not.
if ($pnpDevs.Description -match "Smart.?card") {Write-Host "Smartcard = True"} else {Write-Host "Smartcard = False"}
if ($pnpDevs.Description -match "Finger|FPR") {Write-Host "Finger print = True"} else {Write-Host "Finger print = False"}
if ($pnpDevs.Description -match "\bFac(e|ial)\b") {Write-Host "Facial = True"} else {Write-Host "Facial = False"}
if ($pnpDevs.Description -match "NFC") {Write-Host "NFC = True"} else {Write-Host "NFC = False"}