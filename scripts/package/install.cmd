@echo off
REM Silent install with vendor-supported switches
REM Replace switches as per vendor documentation.
setlocal
set INSTALLER=cloudprintscan_setup.exe

if not exist "%~dp0%INSTALLER%" (
  echo Installer not found: %INSTALLER%
  exit /b 1
)

REM Example silent switch:
"%~dp0%INSTALLER%" -s -on "ORG"

REM Write marker on success
if %errorlevel% EQU 0 (
  powershell -NoProfile -ExecutionPolicy Bypass -Command "New-Item -ItemType Directory -Force -Path 'C:\ProgramData\Vendor\App' > $null; New-Item -ItemType File -Force -Path 'C:\ProgramData\Vendor\App\installed.marker' > $null"
)

exit /b %errorlevel%
