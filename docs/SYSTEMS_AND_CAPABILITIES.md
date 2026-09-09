# Systems and Capabilities

## Status vocabulary

- `UNKNOWN`: Not assessed or insufficient evidence
- `DISCOVERING`: Assessment in progress
- `AVAILABLE`: Verified usable for the stated scope
- `AVAILABLE_WITH_LIMITS`: Verified with documented constraints
- `REQUIRES_APPROVAL`: Technically possible but not authorized
- `UNAVAILABLE`: Verified absent or unusable
- `REJECTED`: Considered and intentionally not permitted or selected
- `STALE`: Prior evidence is no longer current enough to rely on

Availability is scoped. A successful health check or visible connector is not proof of an end-to-end authorized workflow.

<!-- BOOTSTRAP:BEGIN capability-matrix -->
| Capability | Status | Scope/limits | Evidence | Verified UTC | Owner/approver |
|---|---|---|---|---|---|
| Local repository read | UNKNOWN | — | — | — | — |
| Local file edit | UNKNOWN | — | — | — | — |
| Git status/diff/history | UNKNOWN | — | — | — | — |
| Git branch creation | UNKNOWN | — | — | — | — |
| Git commit | UNKNOWN | — | — | — | — |
| Git push | UNKNOWN | Requires explicit approval by default | — | — | — |
| Pull-request creation | UNKNOWN | Requires explicit approval by default | — | — | — |
| Command/test execution | UNKNOWN | — | — | — | — |
| Foundry file attachment | UNKNOWN | — | — | — | — |
| Foundry knowledge/file search | UNKNOWN | Fallback for repository context | — | — | — |
| Foundry code execution | UNKNOWN | Not equivalent to local repository execution | — | — | — |
| Power BI APIs/embedding | UNKNOWN | GCC High availability unverified | — | — | — |
| Microsoft Fabric | UNKNOWN | — | — | — | — |
| SharePoint | UNKNOWN | — | — | — | — |
| Microsoft Graph/Outlook | UNKNOWN | — | — | — | — |
| Power Platform/Power Automate | UNKNOWN | — | — | — | — |
| Azure DevOps or GitHub remote | UNKNOWN | — | — | — | — |
| MCP/OpenAPI tools | UNKNOWN | — | — | — | — |
| Audit and observability | UNKNOWN | — | — | — | — |
| Approved data classification | UNKNOWN | Do not upload sensitive data until confirmed | — | — | — |
<!-- BOOTSTRAP:END capability-matrix -->

## Update rule

Every non-`UNKNOWN` status must identify its scope, evidence, verification date, and owner where applicable. Downgrade evidence to `STALE` when configuration, identity, policy, or sufficient time has changed.
