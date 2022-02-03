# Requires Dell Command|Monitor be installed on a Dell computer.
# Get-WmiObject is not available in PowerShell Core though this should be a problem in most environments as Core is not usually the default
Get-WmiObject -Namespace root\dcim\sysman -Class DCIM_BIOSEnumeration -Filter {AttributeName='Trusted Platform Module'} | `
    Select-Object -ExpandProperty CurrentValue