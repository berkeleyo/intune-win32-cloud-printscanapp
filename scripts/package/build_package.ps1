param(
    [string]$Installer = ".\cloudprintscan_setup.exe",
    [string]$OutputDir = ".\output",
    [string]$AppInfoJson = ".\appinfo.json"
)

# Ensure IntuneWinAppUtil.exe is available in PATH or alongside this script
$intuneUtil = "IntuneWinAppUtil.exe"
if (-not (Get-Command $intuneUtil -ErrorAction SilentlyContinue)) {
    $local = Join-Path (Split-Path -Parent $PSCommandPath) $intuneUtil
    if (Test-Path $local) { $intuneUtil = $local } else {
        Write-Error "IntuneWinAppUtil.exe not found in PATH or script folder."
        exit 1
    }
}

if (!(Test-Path $OutputDir)) { New-Item -ItemType Directory -Path $OutputDir | Out-Null }

# Read app metadata
if (!(Test-Path $AppInfoJson)) { Write-Error "Missing appinfo.json"; exit 1 }
$app = Get-Content $AppInfoJson | ConvertFrom-Json

Write-Host "Packaging $($app.DisplayName) $($app.Version)..."

# Wrap into .intunewin
& $intuneUtil -c . -s (Split-Path -Leaf $Installer) -o $OutputDir | Write-Host

Write-Host "Done. Check $OutputDir for the .intunewin package."
