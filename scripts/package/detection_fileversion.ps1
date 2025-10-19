param(
  [Parameter(Mandatory=$false)][string]$Path = "C:\Program Files\Kyocera\Kyocera Cloud Print and Scan\JcsUiAgent\JcsUiAgent.exe",
  [Parameter(Mandatory=$false)][string]$ExpectedVersion = "1.14.28321.0"
)

# Exit 0 if file exists and version >= expected; else 1.
if (Test-Path $Path) {
    try {
        $v = (Get-Item $Path).VersionInfo.FileVersion
        if ([Version]$v -ge [Version]$ExpectedVersion) { exit 0 } else { exit 1 }
    } catch {
        exit 1
    }
} else {
    exit 1
}
