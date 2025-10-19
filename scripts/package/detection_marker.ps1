# Returns exit code 0 if detected, non-zero if not detected.
$marker = "C:\ProgramData\Vendor\App\installed.marker"
if (Test-Path $marker) { exit 0 } else { exit 1 }
