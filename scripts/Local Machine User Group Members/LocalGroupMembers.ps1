# Create an array object
$GroupInfo = New-Object -TypeName System.Collections.ArrayList

# Collect groups
$groups = Get-LocalGroup

foreach ($group in $groups) {
    # Retreive members for each group
    $users = Get-LocalGroupMember $group
    
    # Will only proceed if a group has members
    If ($users) {
        foreach ($user in $users) {
            # Cast index output to void or it will output the index number as it cycles through
            [void]$GroupInfo.Add((
                # Create the PSObject with the data
                New-Object -TypeName psobject -Property @{
                    'Group' = $group.Name
                    'Name' =  $user.Name
                    'Class' = $user.ObjectClass
                    'Source' = $user.PrincipalSource
                }
            ))
        }
    }
}

# Output the data as list. I grouped by the group.
$GroupInfo | Format-List -GroupBy Group