'{0:X6}' -f (Get-WmiObject -Namespace root\SecurityCenter2 -ClassName AntiVirusProduct -Filter "displayName='Windows Defender'" | Select-Object -ExpandProperty productState)

'{0:X6}' -f (Get-CimInstance -Namespace root\SecurityCenter2 -ClassName AntiVirusProduct -Filter "displayName='Windows Defender'" | Select-Object -ExpandProperty productState)