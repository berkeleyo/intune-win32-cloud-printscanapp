# SECURITY

- **No secrets** in repository. No tenant IDs, hostnames, or IPs.
- RBAC: use least-privileged roles for Intune app management.
- For automation, prefer **Managed Identity** or a **service principal** with the minimal required Microsoft Graph permissions.
- Store secrets in a secure vault, never in scripts or CI variables without protection.
- Validate vendor installers via checksum/signature.
- Ensure scripts are idempotent and safe to re-run.
