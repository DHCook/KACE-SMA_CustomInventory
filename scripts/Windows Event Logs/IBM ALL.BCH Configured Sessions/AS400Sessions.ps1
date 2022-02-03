# IBM's Client Access creates an environment variable which can be used to verify CA is installed and find its location
# Typically resolves to C:\Program Files (x86)\IBM\Client Access\Emulator
$ibmCAPath = ((Get-Childitem env:Path).value.split(";")) -match '\\Emulator$'

# If the path exists
if ($ibmCAPath) {

    # Check for the presence of ALL.BCH file
    if (Test-Path $ibmCAPath\Private\ALL.BCH) {
        # Read the contents of the file
        $ibmAllBCH = (Get-Content $ibmCAPath\Private\ALL.BCH)
        # The standard naming scheme for the sessions for the environment I worked in was 'SessionS' followed by a number that increased incrementally
        # Adjust this query accordingly
        $ibmSessions = ($ibmAllBCH -match '^Run\d=c.*SessionS\d').count
        # Print sessions were named 'SessionPRT'
        # Adjust accordingly
        $ibmPrint = ($ibmAllBCH -match '^Run\d=c.*SessionPRT').count

        # Add names for the number outputs
        $display = "Display : $ibmSessions"
        $printer = "Printer : $ibmPrint"

        # Output the data
        Write-Output $display $printer
    }
}