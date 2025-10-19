@echo off
REM Silent uninstall using vendor flags
setlocal
set UNINSTALLER=cloudprintscan_setup.exe

REM Example silent uninstall flag:
"%~dp0%UNINSTALLER%" -s -uninstall

REM Optional: remove marker
powershell -NoProfile -ExecutionPolicy Bypass -Command "Remove-Item -Path 'C:\ProgramData\Vendor\App\installed.marker' -Force -ErrorAction SilentlyContinue"
exit /b %errorlevel%
