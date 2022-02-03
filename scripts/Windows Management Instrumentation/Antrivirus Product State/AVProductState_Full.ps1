# Convert output to hex
'{0:X6}' -f (
    # Get-WmiObject is not available in PowerShell Core though this should be a problem in most environments as Core is not usually the default
    # Change "Windows Defender" to your AV product. Run the following without the filter and a Select * to get the correct displayName
    Get-WmiObject -Namespace root\SecurityCenter2 -ClassName AntiVirusProduct -Filter "displayName='Windows Defender'" | `
    
    # Expand the Product State attribute to return only it's value which will be converted to hex
    Select-Object -ExpandProperty productState
    )

# Compatible with PowerShell Core using CimInstance instead
# Convert output to hex
'{0:X6}' -f (
    # Change "Windows Defender" to your AV product. Run the following without the filter and a Select * to get the correct displayName
    Get-CimInstance -Namespace root\SecurityCenter2 -ClassName AntiVirusProduct -Filter "displayName='Windows Defender'" | `
    
    # Expand the Product State attribute to return only it's value which will be converted to hex
    Select-Object -ExpandProperty productState
    )