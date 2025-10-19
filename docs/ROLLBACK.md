# ROLLBACK

**Primary options:**
1. Supersedence: set older known-good build to supersede current.
2. Uninstall assignment to impacted rings or all devices if urgent.

**Steps:**
- Create *Uninstall* assignment for the app to the impacted group(s)
- Validate uninstall detection state changes to *Not installed*
- Remove/disable current *Required* assignment
- If needed, re-publish previous stable version as *Required*

**Verification:**
- Check Intune installation status and device logs
- Confirm marker file removal (if uninstall removes it)
