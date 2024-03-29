if ($s = (Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Appraiser\GWX' -ErrorAction SilentlyContinue).SdbEntries) {
    Write-Output $s
} else {
    Out-Null
}