# Discovery Playbook

Discovery converts assumptions into scoped, dated evidence. Begin read-only and avoid sensitive output.

## 1. Repository and AI tooling

- Locate the repository root.
- Identify the AI product and whether it is a playground, configured agent, or custom wrapper.
- Enumerate local-file and Git MCP operations.
- Verify read operations first: status, diff, history, branch, and remote metadata.
- Use a disposable branch/file for write tests only after approval.

## 2. Existing product inventory

- Inventory Power BI reports, semantic models, workspaces, owners, audiences, refreshes, and dependencies.
- Compare tables, relationships, measures, calculation groups, security roles, and business rules.
- Inventory the Excel/HTML prototype by user-visible capability, not implementation alone.
- Classify each capability as Power BI, SPA, backend/API, workflow/integration, or operational store.

## 3. Enterprise capability discovery

- Validate Power BI embedding method, licensing/capacity, APIs, and sovereign-cloud availability.
- Validate identity/app-registration path and owner.
- Validate candidate hosting, API, secrets, monitoring, and CI/CD platforms.
- Validate operational-store candidates against governance and transactional requirements.
- Validate Graph/Outlook, Power Automate, SharePoint, Fabric, and other integrations independently.

## 4. Evidence standard

For each claim capture:

- What was tested
- Identity and environment scope without exposing secrets
- Expected and observed result
- Date/time
- Evidence reference
- Limitations
- Owner or approver
- Whether the result proves configuration, authorization, or an end-user workflow

Use `templates/discovery-evidence.md`. Do not treat documentation or a visible menu item as proof that the feature works in the actual environment.
