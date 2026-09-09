# Requirements

These requirements are durable intent. Technical mechanisms remain subject to evidence and accepted decisions.

## Analytics

- `AN-01`: Preserve Power BI as the primary analytics and visualization layer.
- `AN-02`: Converge overlapping semantic models toward a governed canonical model where practical.
- `AN-03`: Support multiple thin reports and report pages within one application shell.
- `AN-04`: Preserve appropriate Power BI permissions, RLS, and OLS.
- `AN-05`: Normal Power BI visual changes should not require SPA regeneration.

## Application experience

- `APP-01`: Provide centralized navigation across analytical and operational sections.
- `APP-02`: Accept selected-record context from an embedded report when supported by a verified event contract.
- `APP-03`: Provide native action panels, details, forms, notes, assignments, status, and history.
- `APP-04`: Keep analytical filtering and report UX in Power BI.

## Backend and data

- `API-01`: Route writes, validation, authorization, audit, and integrations through a backend/API.
- `DATA-01`: Store application-generated records in a governed persistent operational store.
- `DATA-02`: Do not refresh Power BI solely to display a newly saved operational record.
- `DATA-03`: Retain actor, timestamp, entity type, and entity identifier for auditable changes.
- `DATA-04`: Keep source SQL systems read-only unless separately authorized.

## Integration

- `INT-01`: Generate reviewable email drafts through an approved enterprise mechanism.
- `INT-02`: Do not select Microsoft Graph, Power Automate, or another mechanism before environment validation.
- `INT-03`: Treat report-selection payload shape and stable record identity as a proof-of-concept contract, not an assumption.

## Delivery and operations

- `OPS-01`: Separate DEV, TEST, and PROD resources and configuration.
- `OPS-02`: Ensure production application configuration references only production Power BI resources.
- `OPS-03`: Use source control, review, validation, deployment evidence, and rollback.
- `OPS-04`: Keep AI-assisted tasks narrow after foundational patterns are established.

## Security and governance

- `SEC-01`: Validate every required capability in the actual work environment.
- `SEC-02`: Use enterprise identity and least privilege.
- `SEC-03`: Never infer GCC High availability from commercial documentation alone.
- `SEC-04`: Keep secrets and controlled data out of prompts, commits, and unauthorized knowledge stores.
