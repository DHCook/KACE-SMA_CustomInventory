#Hashes supported by AMT on the system
$CertificateHashes = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Intel\Setup and Configuration Software\SystemDiscovery\ManageabilityInfo\ManagementSettings" -Name CertificateHashes -ErrorAction SilentlyContinue | Select-Object -ExpandProperty CertificateHashes) -split '; ' -replace (', Enabled, Default', '')| Sort-Object
#A list of CAs that have been found to be supported by most devices on our network
#NOTE: Update this list with new CAs as they become avilable.
$DefaultCA = "Baltimore CyberTrust Root", "Comodo AAA CA", "Cybertrust Global Root", "Entrust Root CA", "Entrust.net CA (2048)", "Go Daddy Class 2 CA", "Starfield Class 2 CA", "VeriSign Class 3 Primary CA-G5", "Verizon Global Root"
if ($CertificateHashes) {
    foreach ($Cert in $CertificateHashes) {
        foreach ($CA in $DefaultCA) {
            if ($Cert -match $CA) {
                $Cert
            }
        }
    }
}