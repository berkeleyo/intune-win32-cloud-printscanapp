# 🧰 Runbook — Intune Win32 Deployment (Kyocera Cloud Print & Scan, redacted)

## 1) Preparation
- Obtain the vendor installer (silent-capable). Example: `cloudprintscan_setup.exe`
- Confirm silent switches (e.g., `-s`, `/S`, `/quiet`, vendor-specific flags).
- Decide detection strategy:
  - Primary: **marker file** (e.g., `C:\ProgramData\Vendor\App\installed.marker`)
  - Fallback: **file version** on a stable binary.
- Populate `scripts/package/appinfo.json`.

## 2) Package creation
- Place installer into `scripts/package/`.
- Run PowerShell as admin:
  ```powershell
  ./scripts/package/build_package.ps1
  ```
- Output `.intunewin` will be created alongside the scripts or under `scripts/package/output/`.

## 3) Intune app configuration
- In Intune Admin Center:
  - App type: **Windows app (Win32)**
  - Upload the generated `.intunewin`
  - **Install command:** `install.cmd`
  - **Uninstall command:** `uninstall.cmd`
  - **Install behavior:** System
  - **Device restart behavior:** Determine based on vendor guidance (usually *No specific action*)
  - **Detection rules:** Script rule → `detection_marker.ps1` (preferred)
  - **Fallback detection:** `detection_fileversion.ps1` configured as an alternate method
  - **Requirements:** OS ≥ Windows 10 22H2 (adjust per your baseline), 64‑bit
  - **Return codes:** Default MSI codes + vendor non‑MSI success code if applicable

## 4) Assignment & rings
- Create groups: `Win-Apps-Pilot`, `Win-Apps-Broad` (example names).
- Assign to **Pilot** as *Required*. Monitor success ≥ 95% before broadening.
- For upgrades, use **Supersedence** to remove older versions.

## 5) Observability & support
- Monitor: **Apps → Monitor → Installation status**.
- Device-side logs:
  - IME: `C:\ProgramData\Microsoft\IntuneManagementExtension\Logs\IntuneManagementExtension.log`
  - App logs: vendor location (varies)
- Escalation workflow: service desk → endpoint team → vendor.

## 6) Rollback
- Use **Uninstall** assignment or supersedence remove option.
- If urgent, convert to *Uninstall* for impacted rings only.
- See `docs/ROLLBACK.md` for step-by-step.

## 7) Security
- No secrets in scripts. Use managed identities or secure key storage for automation.
- RBAC: least privilege for app administrators.
- See `docs/SECURITY.md`.
