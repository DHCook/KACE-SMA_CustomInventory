# Requires Dell Command|Monitor be installed on a Dell computer.
# Increase the number of values displayed in ouput. More info:
# https://devblogs.microsoft.com/powershell-community/how-to-use-formatenumerationlimit/
$FormatEnumerationLimit=10

# Get-WmiObject is not available in PowerShell Core though this should be a problem in most environments as Core is not usually the default
Get-WmiObject -Namespace root\dcim\sysman -Query "Select AttributeName,PossibleValuesDescription,PossibleValues,CurrentValue from DCIM_BIOSEnumeration" | `
    # Sort the list by the BIOS setting name
    Sort-Object -Property AttributeName | `

    # Only grab what values are needed
    Select-Object AttributeName,PossibleValuesDescription,PossibleValues,CurrentValue | `

    # KACE Device Details page does not format table outputs into a table. Use Format-List instead.
    Format-List