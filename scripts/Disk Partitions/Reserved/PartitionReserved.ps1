# Get the partition size
$ReClass = Get-Partition | Where-Object {$_.Type -eq "Reserved"} | Select-Object -ExpandProperty Size

# Make the output readable
switch($ReClass) {
{$_ -gt 1GB} {
'{0:0.0} GB' -f ($_/1GB)
break
}
{$_ -gt 1MB} {
'{0:0.0} MB' -f ($_/1MB)
break
}
{$_ -gt 1KB} {
'{0:0.0} KB' -f ($_/1KB)
break
}
default { "$_ bytes" }
}