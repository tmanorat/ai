# Access and Approvals

This register separates technical availability from authorization.

<!-- BOOTSTRAP:BEGIN approvals-register -->
| Action or resource | Current access | Approval required | Authorized owner | Evidence/status |
|---|---|---|---|---|
| Read local repository | UNKNOWN | Determine during bootstrap | UNKNOWN | UNKNOWN |
| Edit local files | UNKNOWN | Determine during bootstrap | UNKNOWN | UNKNOWN |
| Create local branch/commit | UNKNOWN | Determine during bootstrap | UNKNOWN | UNKNOWN |
| Push or create pull request | UNKNOWN | Yes by default | UNKNOWN | UNKNOWN |
| Create enterprise app registration | UNKNOWN | Yes | UNKNOWN | UNKNOWN |
| Connect Power BI resources | UNKNOWN | Yes | UNKNOWN | UNKNOWN |
| Create or access write-back storage | UNKNOWN | Yes | UNKNOWN | UNKNOWN |
| Connect email/workflow services | UNKNOWN | Yes | UNKNOWN | UNKNOWN |
| Deploy DEV/TEST/PROD resources | UNKNOWN | Yes | UNKNOWN | UNKNOWN |
| Upload sensitive data to Foundry knowledge | UNKNOWN | Yes | Security/data owner | BLOCKED UNTIL CONFIRMED |
<!-- BOOTSTRAP:END approvals-register -->

## Rules

- Access is not approval.
- Read access does not imply write access.
- Test-environment approval does not imply production approval.
- Record approvals with date, scope, owner, and any expiration or conditions.
- Do not store approval emails or sensitive evidence here unless repository policy explicitly permits it; use a safe reference.
