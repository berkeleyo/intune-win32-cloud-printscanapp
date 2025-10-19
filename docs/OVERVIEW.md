# OVERVIEW

This project demonstrates a production-grade pattern to deploy a vendor desktop application via **Microsoft Intune (Win32)** using:
- **Silent installer** with vendor-provided switches
- **Marker-file detection** (primary) and **file version** (fallback)
- **Rings-based rollout** with **supersedence** for upgrades
- **Redaction-first** documentation: no secrets, identifiers, or tenant details

Target app example: *Kyocera Cloud Print & Scan* — version randomized for documentation (**v1.14.28321.0**) and **not** the real deployed version.
