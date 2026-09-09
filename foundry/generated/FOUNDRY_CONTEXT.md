# Generated Microsoft Foundry Context

> GENERATED FILE — DO NOT EDIT. Update the canonical source files and run `scripts/build-foundry-context.ps1`.

The Git repository is authoritative if this bundle differs from repository files.

---

## Source: `START_HERE.md`

# Start Here

This is the universal entry point for any human or AI assistant.

## Route the session

1. Read `.ai/bootstrap-manifest.json`.
2. If its status is `NOT_STARTED` or `IN_PROGRESS`, follow `BOOTSTRAP.md` exactly.
3. If its status is `COMPLETE`, read in this order:
   1. `AI.md`
   2. `STATE.md`
   3. Relevant accepted decisions linked from `docs/DECISIONS.md`
   4. Only the source and evidence files needed for the current task

Do not assume an AI product automatically loaded repository instructions. Explicitly read these files.

## Instruction precedence

When instructions conflict, use this order:

1. The human's explicit current task
2. Security, legal, and approval boundaries
3. Accepted architecture decisions
4. `STATE.md`
5. `AI.md` and detailed project documentation
6. Existing implementation and conventions

Never silently overturn an accepted decision. Explain the conflict and propose a new or superseding decision.

## Working loop

Use this loop for every task:

> READ → VERIFY → CHANGE → TEST → RECORD

- Begin with read-only repository and environment checks.
- Identify the layer affected before editing.
- Make the smallest coherent change.
- Reuse established patterns and avoid unrelated refactors.
- Run relevant validation, tests, lint, and type checks when available.
- Review the complete diff before finishing.
- Update `STATE.md` when implementation state materially changes.
- Add a handoff record under `handoffs/` for meaningful work.
- Commit implementation and related context together when authorized.
- Do not push, merge, deploy, connect a new system, or make a production change without the applicable approval.

## Normal prompt

After bootstrap, the normal user prompt is:

> Continue from `STATE.md`. Task: ___

The task is not complete until the relevant checks and handoff are complete.

---

## Source: `BOOTSTRAP.md`

# One-Time Work Environment Bootstrap

## User prompt

The user starts initialization with:

> Initialize this repository by reading and executing `BOOTSTRAP.md` completely.

This process is intentionally tool-neutral. Use available local-file tools for reading and editing and the available Git MCP for repository operations.

## Safety contract

Before doing anything else, read `.ai/bootstrap-manifest.json`.

- If `status` is `COMPLETE`, do not reinitialize or clear files. Read `START_HERE.md` and continue from `STATE.md`.
- If `status` is `IN_PROGRESS`, inspect the current diff and resume without discarding prior work.
- If `status` is `NOT_STARTED`, follow the sequence below.
- Never delete or overwrite content outside the manifest's `populateFiles` list during bootstrap.
- Replace only content between matching `BOOTSTRAP:BEGIN` and `BOOTSTRAP:END` markers.
- Preserve useful existing values. Do not blank a populated section merely because a capability cannot be reverified.
- Never discard uncommitted work, reset history, force-push, expose credentials, or weaken repository protections.
- Mark unverifiable facts `UNKNOWN`; do not guess.
- Ask only when a required approval or genuinely undiscoverable choice blocks safe progress.

## Step 1 — Read-only preflight

1. Locate and report the repository root.
2. Read `START_HERE.md`, `AI.md`, `STATE.md`, and the bootstrap manifest.
3. Inspect Git status, current branch, recent history, and configured remotes.
4. Confirm whether unrelated uncommitted changes exist.
5. Inventory available tools without invoking mutating operations.
6. Confirm whether the Git MCP controls local Git, a remote provider, or both.

If unrelated uncommitted changes exist, preserve them and stop before bootstrap edits unless they can be safely isolated.

## Step 2 — Isolate bootstrap work

If supported, create or switch to a branch named `bootstrap/work-environment`. If branch creation is unavailable, record that limitation and continue only if the user has authorized work on the current branch.

Change the manifest status to `IN_PROGRESS` before populating templates.

## Step 3 — Discover capabilities

Follow `foundry/CAPABILITY_PROBE.md` and `docs/DISCOVERY_PLAYBOOK.md`. Begin read-only.

Capture only verified, non-secret information about:

- AI product, experience, project, and agent type
- Local file read and edit capability
- Git status, diff, history, branch, commit, push, and pull-request capability
- Command or test execution capability
- File attachment and knowledge retrieval
- Power BI, Fabric, SharePoint, Microsoft Graph, Power Platform, GitHub, and Azure DevOps access
- Tool protocols such as MCP or OpenAPI
- Audit, retention, storage, regional, isolation, and approval constraints

Use the status vocabulary in `docs/SYSTEMS_AND_CAPABILITIES.md`. A configured tool is not proof that the current identity is authorized to use it.

## Step 4 — Populate allowlisted files

Replace only the marked bootstrap sections in:

- `docs/WORK_ENVIRONMENT.md`
- `docs/SYSTEMS_AND_CAPABILITIES.md`
- `docs/ACCESS_AND_APPROVALS.md`
- `STATE.md`
- `foundry/LOCAL_AGENT_PROFILE.md`

For every material capability claim, record how and when it was verified. Never store tokens, credentials, tenant IDs, sensitive URLs, production data, or controlled information.

Do not promote a proposed architecture decision to accepted merely because a tool exists. Decision acceptance remains a human-owned governance action unless the user explicitly delegates it.

## Step 5 — Validate and close out

1. Create a bootstrap evidence record using `templates/discovery-evidence.md` if safe evidence is available.
2. Create a timestamped handoff under `handoffs/` using `templates/handoff-entry.md`.
3. Update `STATE.md` with the current objective, known blockers, last verified result, and one concrete next step.
4. Regenerate `foundry/generated/FOUNDRY_CONTEXT.md` if command execution is available. Otherwise record that it remains stale.
5. Run `scripts/validate-context.ps1` if PowerShell execution is available. Otherwise perform its checks manually.
6. Review the complete Git diff.
7. Set the bootstrap manifest status to `COMPLETE` only after the required files are populated and validation passes.
8. Prepare one bootstrap commit if commit access is available.
9. Do not push or create a pull request unless the user or established repository policy authorizes it.

## Completion report

Report:

- Repository and branch
- Files changed
- Capabilities verified
- Capabilities still unknown or requiring approval
- Validation performed and result
- Commit identifier, if created
- Whether anything was pushed
- The single recommended next task

After completion, all future sessions start with:

> Continue from `STATE.md`. Task: ___

---

## Source: `.ai/bootstrap-manifest.json`

{
  "schemaVersion": 1,
  "status": "NOT_STARTED",
  "completedAtUtc": null,
  "replaceSectionsOnly": true,
  "populateFiles": [
    "docs/WORK_ENVIRONMENT.md",
    "docs/SYSTEMS_AND_CAPABILITIES.md",
    "docs/ACCESS_AND_APPROVALS.md",
    "STATE.md",
    "foundry/LOCAL_AGENT_PROFILE.md"
  ],
  "preserveFiles": [
    "START_HERE.md",
    "AI.md",
    "SECURITY.md",
    "docs/PRODUCT.md",
    "docs/REQUIREMENTS.md",
    "docs/REFERENCE_ARCHITECTURE.md",
    "docs/OWNERSHIP_BOUNDARIES.md",
    "docs/SECURITY_BOUNDARY.md",
    "docs/DELIVERY_ROADMAP.md",
    "docs/DECISIONS.md"
  ],
  "approvalRequired": [
    "push",
    "pull_request_creation",
    "merge",
    "tag_or_release",
    "external_connection",
    "dependency_installation",
    "production_change",
    "destructive_git_operation",
    "accept_or_supersede_architecture_decision"
  ],
  "neverDo": [
    "force_push",
    "discard_uncommitted_work",
    "commit_secrets",
    "copy_work_content_to_personal_systems",
    "invent_capability_evidence"
  ]
}

---

## Source: `AI.md`

# Stable AI Project Context

## Project purpose

Build a centralized internal application that hosts governed Power BI analytics and adds native workflow and write-back capabilities around them.

The repository is also the durable context system for human and AI-assisted development. Chat sessions are disposable; version-controlled project facts, decisions, evidence, and handoffs are authoritative.

Context verification phrase: `NORTHSTAR-POWERBI-ACTIONS`.

## Product direction

- Power BI is the analytics and visualization layer.
- A React and TypeScript single-page application is the proposed application shell and workflow interface.
- A backend/API is responsible for writes, validation, authorization, workflows, and integrations.
- A governed operational store is responsible for notes, assignments, status, and audit history.
- AI assists development; it is not required runtime infrastructure.
- The existing Excel-to-HTML tool is a prototype and requirements reference, not the production foundation.

The target architecture remains a reference design until work-environment discovery and accepted decisions confirm implementation choices.

## Primary design boundaries

- Keep Power BI responsible for reports, DAX, measures, slicers, drill-through, tooltips, analytical filtering, and report UX.
- Keep the web application responsible for navigation, action panels, forms, details, and workflow state.
- Keep writes, validation, authorization, and integrations behind a backend/API.
- Do not recreate normal Power BI charts in frontend code without a documented reason.
- Do not use Excel as the long-term production write-back database.
- Do not refresh the semantic model merely to show a note immediately; retrieve operational records through the application API.
- Do not introduce microfrontends unless independently deployed frontend boundaries become a verified requirement.
- Do not assume commercial-cloud features are available in a GCC High or sovereign environment.

## Source-of-truth map

- `AI.md`: stable project truth and boundaries
- `STATE.md`: current phase, active work, blockers, and next action
- `docs/`: detailed product, architecture, capability, and security context
- `docs/decisions/`: decision records with explicit status
- `evidence/`: sanitized verification artifacts
- `handoffs/`: task completion records
- Git history: what changed and when
- Chat: temporary task discussion only

## Important folders

- `.ai/`: guarded one-time bootstrap state
- `.github/`: GitHub Copilot and collaboration entry points
- `docs/`: durable project documentation
- `foundry/`: Microsoft Foundry adapter and optional generated context bundle
- `scripts/`: dependency-light validation and context generation
- `templates/`: repeatable evidence, planning, capability, and handoff formats
- `transfer/`: clean personal-to-work migration instructions

Application source folders do not exist yet. Add them only after the applicable roadmap gate and architecture decisions are complete.

## Commands

From the repository root in PowerShell:

```powershell
./scripts/build-foundry-context.ps1
./scripts/validate-context.ps1
```

If script execution is unavailable, follow the corresponding checks manually and record the limitation.

## Project rules

- Start with `START_HERE.md` and perform read-only checks before edits.
- Preserve unrelated user changes.
- Make the smallest coherent change and avoid unrelated refactors.
- Prefer simple, maintainable solutions and existing platform capabilities.
- Do not add a dependency, service, or recurring cost without a clear reason and approval.
- Never commit secrets or controlled data.
- Treat configured access as unverified until tested safely.
- Use evidence and verification dates for environment claims.
- Run relevant checks and review the complete diff.
- Update `STATE.md` and leave a handoff after meaningful work.
- Do not push, merge, deploy, or modify production without authorization.

## Decision discipline

Decision statuses are `PROPOSED`, `ACCEPTED`, `SUPERSEDED`, and `REJECTED`.

Do not silently change an accepted decision. Create a superseding decision that records the reason, impact, evidence, approver, and rollback considerations.

---

## Source: `STATE.md`

# Project State

## Active goal

Transfer this sanitized context repository into a new work-owned repository, then run the guarded work-environment bootstrap.

## Phase

Phase 0 — Handoff and isolation.

## Current branch

`main`

## Last completed

The portable repository context, one-prompt bootstrap design, Foundry adapter, transfer controls, and validation workflow were created.

## In progress

<!-- BOOTSTRAP:BEGIN state-in-progress -->
Work-environment bootstrap has not started. The corporate AI, Git MCP, local editing, enterprise tools, and environment constraints remain unverified in this repository.
<!-- BOOTSTRAP:END state-in-progress -->

## Known issues and blockers

<!-- BOOTSTRAP:BEGIN state-blockers -->
- The final work repository name and remote are not recorded here.
- Corporate AI and Git MCP capabilities are `UNKNOWN` until verified in the work environment.
- GCC High approval and feature availability are `UNKNOWN` until confirmed by authorized owners.
<!-- BOOTSTRAP:END state-blockers -->

## Next step

<!-- BOOTSTRAP:BEGIN state-next-step -->
Perform the clean transfer in `transfer/PERSONAL_TO_WORK.md`, open the new local work repository in the company AI, and send: `Initialize this repository by reading and executing BOOTSTRAP.md completely.`
<!-- BOOTSTRAP:END state-next-step -->

## Last verified

<!-- BOOTSTRAP:BEGIN state-last-verified -->
Repository bootstrap files were locally generated and validated on 2026-09-08. Work-environment capabilities have not been verified.
<!-- BOOTSTRAP:END state-last-verified -->

## Handoff log

- Timestamp: 2026-09-08
- Summary of changes: Created the initial portable AI handoff and guarded bootstrap system.
- Notes: The next authoritative update must occur in the isolated work-owned repository.

---

## Source: `SECURITY.md`

# Repository Security Policy

## Purpose

This repository crosses from a personal planning environment into an enterprise/government-contractor environment. The transfer must be one-way and sanitized.

## Allowed in the personal transfer repository

- Generic product goals and architecture patterns
- Sanitized requirements without employer, customer, program, or contract identifiers
- Templates, checklists, scripts, and placeholders
- Publicly documented technology names
- Synthetic examples

## Prohibited in the personal transfer repository

- Credentials, access tokens, keys, certificates, cookies, or connection strings
- Tenant, subscription, account, server, database, workspace, or internal repository identifiers
- Internal URLs, network diagrams, hostnames, or screenshots
- Real operational, personnel, financial, customer, or production data
- CUI, ITAR-controlled, export-controlled, classified, or contract-restricted information
- Proprietary source code or documents copied from the work environment
- Security findings or system configurations not approved for external storage

## Work-environment rule

After the clean transfer, work-specific facts and implementation stay in the work-owned repository and approved enterprise systems. Never synchronize them back to this personal repository or a personal AI account.

## AI and tool rule

- A tool being visible does not establish authorization.
- Begin new connections and capability checks read-only.
- Record only sanitized evidence.
- Do not expose secrets in prompts, logs, commits, screenshots, or tool output.
- Require approval for external connections, permission expansion, deployments, and production changes.
- Validate Foundry storage, retention, region, user isolation, and data classification before uploading sensitive files.

## Incident response

If prohibited information is found, stop work, do not propagate it, and follow the organization's incident and repository-history remediation process. Do not attempt destructive history rewriting without authorized security guidance.

---

## Source: `foundry/AGENT_INSTRUCTIONS.md`

# Company AI Agent Instructions

Use the local Git repository as the authoritative project context. Do not rely on prior conversation history.

At the start of every task:

1. Locate the repository root.
2. Read `START_HERE.md`.
3. Follow the bootstrap route or normal task route it specifies.
4. Verify Git status and preserve unrelated work.
5. Read only the detailed documentation and source files relevant to the task.

Use local file tools for repository reads and edits. Use Git MCP for status, diff, history, branch, commit, and only authorized remote operations. A tool's presence does not prove permission.

Maintain the Power BI, SPA, backend/API, and operational-store boundaries. Treat GCC High and corporate-system capabilities as unknown until verified with scoped evidence.

For each task, use `READ → VERIFY → CHANGE → TEST → RECORD`. Review the complete diff, update `STATE.md` for material state changes, and leave a handoff. Do not push, merge, deploy, connect new systems, expand permissions, or change production without authorization.

Never output, store, or commit credentials or controlled information. If instructions conflict, follow the precedence in `START_HERE.md`.

---

## Source: `foundry/CAPABILITY_PROBE.md`

# Foundry and Tool Capability Probe

Run this during bootstrap. Start read-only and record results in `docs/WORK_ENVIRONMENT.md`, `docs/SYSTEMS_AND_CAPABILITIES.md`, and `docs/ACCESS_AND_APPROVALS.md`.

## A. Identify the experience

- Record the visible product/host and whether this is a playground, configured agent, or custom company wrapper.
- Record only non-sensitive project, agent, and deployment descriptions.
- Identify configured knowledge sources and tools without invoking writes.

## B. Verify local repository reading

- Locate the repository root.
- Read `AI.md` and report the context verification phrase.
- Read `STATE.md` and report the current phase and next step.
- Confirm that references come from the repository rather than conversation memory.

Expected verification phrase: `NORTHSTAR-POWERBI-ACTIONS`.

## C. Verify Git MCP read operations

- Current branch
- Working-tree status
- Recent commit history
- Configured remotes
- Diff of tracked changes

Record whether the MCP controls local Git, a remote provider, or both.

## D. Verify mutation capabilities safely

Only after approval, use a disposable bootstrap branch and allowlisted bootstrap files to verify:

- Local file edit
- Branch creation
- Selective staging
- Commit creation

Do not test push, PR creation, merge, deletion, reset, or production actions without separate approval.

## E. Inventory enterprise tools

Determine whether Power BI, Fabric, SharePoint, Graph/Outlook, Power Platform, Azure DevOps/GitHub, command execution, File Search, code execution, MCP, or OpenAPI tools are visible. Visibility is `DISCOVERING`, not `AVAILABLE`, until a safe scoped operation succeeds.

## F. Record governance limitations

Record what can be verified about data classification, approved region/cloud, storage, retention, isolation, logging, and tool identity. If policy evidence is absent, use `UNKNOWN` or `REQUIRES_APPROVAL`.

## Retrieval fallback test

If using the generated Foundry context bundle, ask:

1. What is the context verification phrase?
2. Which layer owns trusted writes and authorization?
3. What is the current phase and next step?
4. Which architecture decisions are accepted?
5. What must never be inferred from commercial-cloud documentation?

Incorrect or uncited answers mean the knowledge setup is not an adequate project-context source.

---

## Source: `docs/PRODUCT.md`

# Product

## Requirement statement

Build a centralized internal application that hosts governed Power BI analytics and adds native workflow and write-back capabilities around them.

## Problem

Several Power BI dashboards cover largely the same business subject area. Their semantic models have diverged through incremental additions and local logic. A prior AI-generated HTML tool demonstrated useful workflows but depends on an Excel snapshot and code generation that would be expensive and difficult for BI developers to maintain.

## Intended users

- BI developers who continue to own semantic models, DAX, reports, and analytical UX
- Internal users who need analytics plus record-level actions
- Application developers who own the web shell, APIs, workflow, integrations, and delivery pipeline
- Platform, security, and governance owners who approve enterprise capabilities

## Product direction

The centralized application provides navigation and operational workflows around embedded Power BI reports. Normal report changes remain Power BI changes and should not require regenerating frontend code.

Potential application functions include:

- Select a business record and open an action panel
- Add and retrieve notes immediately
- Assign responsibility
- Change workflow status
- Generate a reviewable email draft
- View details and history
- Navigate among governed analytical sections

## Non-goals

- Rebuilding standard Power BI visuals in JavaScript
- Forcing every report into one giant PBIX
- Making BI developers maintain large amounts of frontend code
- Using Excel as the production transactional store
- Using AI as production runtime infrastructure
- Choosing unverified commercial-cloud features for a sovereign environment

## Success

A BI developer can publish an ordinary report change without changing the SPA. A user can select a real record in an embedded report, perform an authorized native action, and immediately retrieve the resulting operational record with actor and time recorded.

---

## Source: `docs/REQUIREMENTS.md`

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

---

## Source: `docs/REFERENCE_ARCHITECTURE.md`

# Reference Architecture

Status: proposed reference architecture pending work-environment validation.

```text
Internal user
     │
     ▼
React + TypeScript SPA
     ├── Navigation and application state
     ├── Embedded Power BI reports
     └── Native actions, forms, details, and history
                  │
          selected record context
                  │
                  ▼
             Backend/API
        ├── Authorization
        ├── Validation
        ├── Workflow
        ├── Audit
        └── Approved integrations
                  │
                  ▼
       Governed operational store

Power BI reports ──► canonical semantic model ──► source systems
```

## Primary flows

### Analytics

Source systems feed a governed semantic model. Thin Power BI reports provide analytical experiences and are embedded in the application shell.

### Selected-record action

1. A user selects a record in Power BI.
2. A verified client event provides a stable entity identifier and context.
3. The SPA opens a native action panel.
4. The backend revalidates identity, authorization, and authoritative data.
5. The action is stored with actor, time, entity, and audit information.

Do not trust client event payloads as authorization or authoritative business data.

### Immediate note display

After a note is saved, the SPA retrieves it from the operational API. Power BI may ingest notes later for analytics on its normal refresh schedule.

## Environment progression

```text
Power BI: DEV workspace → TEST workspace → PROD workspace
Web/API:  feature branch → review → test deployment → production deployment
```

Exact hosting, authentication, embedding, storage, and CI/CD products remain open decisions.

---

## Source: `docs/OWNERSHIP_BOUNDARIES.md`

# Ownership Boundaries

| Area | Primary owner |
|---|---|
| Semantic model, relationships, measures, DAX | BI team |
| Power BI pages, visuals, slicers, bookmarks, drill-through, tooltips | BI team |
| Analytical report UX and report testing | BI team |
| SPA navigation, panels, forms, drawers, and application state | Application team |
| Power BI embedding wrapper and event translation | Application team with BI contract |
| Backend/API, authorization, validation, and audit | Application team |
| Notes, assignments, status, and workflow persistence | Application/platform team |
| Email and enterprise integrations | Application/platform team with service owners |
| Identity, hosting, network, secrets, and CI/CD controls | Platform/security owners |
| Data classification and approval | Authorized governance owners |

## Boundary rule

Power BI owns analysis. The application owns actions. The backend owns trusted writes and enforcement.

Cross-boundary contracts—especially selected-record identity, authorization, and refresh behavior—must be explicit and tested.

---

## Source: `docs/WORK_ENVIRONMENT.md`

# Work Environment

This file is populated during the one-time bootstrap. Do not record secrets, tenant identifiers, sensitive URLs, or controlled information.

<!-- BOOTSTRAP:BEGIN work-environment -->
## Bootstrap status

`NOT_RUN`

## AI experience

- Product/host: `UNKNOWN`
- Experience type: `UNKNOWN` (for example, Foundry playground, Foundry agent, or internal wrapper)
- Project/agent identifier: `NOT_RECORDED`
- Model/deployment: `UNKNOWN`

## Local workspace

- Repository root discovery: `UNKNOWN`
- Local file read: `UNKNOWN`
- Local file edit: `UNKNOWN`
- Command/test execution: `UNKNOWN`

## Git

- Git MCP type: `UNKNOWN` (local, remote provider, or both)
- Remote provider: `UNKNOWN`
- Default branch: `UNKNOWN`
- Branch protection observed: `UNKNOWN`
- Commit capability: `UNKNOWN`
- Push/PR policy: `UNKNOWN`

## Environment notes

No work-environment discovery has been performed.
<!-- BOOTSTRAP:END work-environment -->

---

## Source: `docs/SYSTEMS_AND_CAPABILITIES.md`

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

---

## Source: `docs/ACCESS_AND_APPROVALS.md`

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

---

## Source: `docs/SECURITY_BOUNDARY.md`

# Security Boundary

## Trust boundaries

The solution may cross browser, SPA, Power BI, identity, API, operational storage, workflow, and source-system boundaries. Each boundary requires explicit authentication, authorization, data-classification, and audit decisions.

## Baseline principles

- Enterprise identity and least privilege
- Server-side authorization for every action
- Client-selected identifiers treated as untrusted input
- Secrets in approved secret stores, never source control
- Environment-specific configuration separated from code
- Auditable changes with actor, time, entity, action, and result
- Data minimization in logs, prompts, evidence, and AI knowledge
- DEV, TEST, and PROD separation
- Deny by default when capability or authorization is unclear

## Foundry boundary

Before using Foundry with work content, verify:

- Approved cloud and region
- Data classifications permitted
- Storage ownership and location
- Retention and deletion behavior
- Conversation, file, vector-store, and tool isolation
- Logging and administrator visibility
- Connected tool identities and scopes
- Whether preview features are permitted

## Power BI boundary

- Preserve RLS/OLS and workspace permissions where applicable.
- Do not treat embedded client events as proof of authorization.
- Re-fetch authoritative data and enforce permissions in the backend.
- Keep report, dataset, tenant, and embedding identifiers outside committed shared configuration where policy requires.

## Operational data boundary

The write-back store must be selected through an accepted decision covering governance, transactions, audit, access control, retention, backup, and operational ownership. Existing writable technology is not automatically the right application database.

---

## Source: `docs/DISCOVERY_PLAYBOOK.md`

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

---

## Source: `docs/DELIVERY_ROADMAP.md`

# Delivery Roadmap

Progress is gated by evidence, not by code generation alone.

## Phase 0 — Handoff and isolation

Exit criteria:

- Sanitized transfer reviewed
- New work-owned repository has independent history
- No personal remote remains
- Repository validation passes

## Phase 1 — Corporate discovery

Exit criteria:

- Company AI and Git MCP operating mode verified
- Required enterprise capabilities have scoped statuses and evidence
- Security and data-handling owners identified
- Blocking approvals recorded

## Phase 2 — Architecture decisions

Exit criteria:

- Authentication and app-registration approach accepted
- Power BI embedding approach and licensing confirmed
- Backend framework and hosting accepted
- Operational store accepted
- DEV/TEST/PROD topology and CI/CD path accepted
- Email/workflow integration direction accepted or deferred

## Phase 3 — Foundation

Exit criteria:

- SPA and backend scaffolds build and test
- Environment configuration and secret handling established
- Authentication skeleton and Power BI wrapper exist
- Shared API, error, logging, and test patterns documented
- No production deployment implied

## Phase 4 — Vertical proof of concept

Exit criteria:

- One enterprise-authenticated application
- One real embedded report
- One stable selected-record contract reaches the SPA
- One native action panel
- One note saved and retrieved without semantic-model refresh
- Actor and timestamp recorded
- A normal report change requires no SPA edit

## Phase 5 — Security and operational validation

Exit criteria:

- Authorization, audit, secrets, data handling, monitoring, backup, and rollback reviewed
- Negative authorization tests pass
- Support and ownership model accepted

## Phase 6 — Semantic-model consolidation

Exit criteria:

- Existing models inventoried and compared
- Canonical model scope accepted
- Thin-report migration plan approved
- Regression and business-rule validation established

## Phase 7 — Workflow expansion

Add assignments, status, history, email drafts, and other capabilities through the established vertical pattern.

## Phase 8 — Release and rollout

Promote through DEV, TEST, and PROD with acceptance evidence, rollback, training, support, and post-release monitoring.

---

## Source: `docs/DECISIONS.md`

# Decision Index

Statuses:

- `PROPOSED`: Under consideration; do not treat as final
- `ACCEPTED`: Governing decision
- `SUPERSEDED`: Replaced by another decision
- `REJECTED`: Considered and intentionally not selected

| ID | Decision | Status |
|---|---|---|
| [ADR-001](decisions/ADR-001-analytics-vs-workflow.md) | Separate analytics from application workflow | PROPOSED |
| [ADR-002](decisions/ADR-002-multiple-thin-reports.md) | One application does not require one PBIX | PROPOSED |
| [ADR-003](decisions/ADR-003-canonical-semantic-model.md) | Prefer a canonical/shared semantic model | PROPOSED |
| [ADR-004](decisions/ADR-004-no-excel-writeback.md) | Do not use Excel as production write-back | ACCEPTED |
| [ADR-005](decisions/ADR-005-standard-spa-first.md) | Use a standard SPA before microfrontends | PROPOSED |
| [ADR-006](decisions/ADR-006-repository-as-project-memory.md) | Repository documentation is durable AI memory | ACCEPTED |
| [ADR-007](decisions/ADR-007-clean-one-way-handoff.md) | Use a clean one-way work-account handoff | ACCEPTED |

Use [ADR-000](decisions/ADR-000-template.md) for new decisions. An accepted decision may be changed only through a new decision that explicitly supersedes it.

---

## Source: `docs/GLOSSARY.md`

# Glossary

- **Canonical semantic model**: Governed shared model intended to reduce duplicated and diverging business logic.
- **Thin report**: Power BI report that primarily contains report definitions and connects to a shared semantic model.
- **SPA**: Single-page web application; proposed React and TypeScript shell for navigation and operational UI.
- **Operational store**: Persistent governed storage for notes, assignments, statuses, workflow, and audit history.
- **Write-back**: An authorized application action that creates or changes operational data.
- **Selected-record contract**: Tested mapping from a Power BI interaction to a stable entity identifier and context used by the SPA.
- **Foundry**: Microsoft Foundry/Azure AI Foundry platform or a company application built on it.
- **Git MCP**: Model Context Protocol tool that may expose local Git, remote-provider operations, or both; exact capabilities must be verified.
- **GCC High**: Microsoft government cloud environment whose features and endpoints may differ from commercial cloud.
- **Evidence**: Dated, scoped observation supporting a capability or acceptance claim.
- **Handoff**: Durable record of what changed, what was verified, blockers, and the next action.

---

## Source: `docs/decisions/ADR-001-analytics-vs-workflow.md`

# ADR-001 — Separate analytics from application workflow

Status: PROPOSED

## Context

Power BI is effective for governed analytics, while the product also requires notes, assignments, email drafting, status changes, forms, and history.

## Decision

Power BI owns analytics and report UX. The SPA owns operational interaction. The backend/API owns trusted writes, authorization, validation, and integrations.

## Consequences

BI developers retain their primary toolset and ordinary report changes do not require frontend regeneration. Cross-layer contracts must be designed and tested.

---

## Source: `docs/decisions/ADR-002-multiple-thin-reports.md`

# ADR-002 — One application does not require one PBIX

Status: PROPOSED

## Context

A unified user experience does not require all analytical content to live in one report artifact.

## Decision

Allow multiple purpose-focused thin reports or pages behind centralized application navigation.

## Consequences

Report ownership and usability can remain focused, but navigation, security, deployment mapping, and shared-model compatibility need coordination.

---

## Source: `docs/decisions/ADR-003-canonical-semantic-model.md`

# ADR-003 — Prefer a canonical/shared semantic model

Status: PROPOSED

## Context

Overlapping reports currently use similar semantic models that have diverged through local changes.

## Decision

Converge duplicated business logic into a governed canonical semantic model where practical, with thin reports consuming it.

## Consequences

This reduces drift but requires inventory, comparison, business-owner validation, migration sequencing, and regression testing. Genuine domain boundaries may justify more than one governed model.

---

## Source: `docs/decisions/ADR-004-no-excel-writeback.md`

# ADR-004 — Do not use Excel as production write-back

Status: ACCEPTED

## Context

Excel enabled a useful prototype but is not the intended governed transactional store for concurrent notes, assignments, status, and audit history.

## Decision

Excel may remain a prototype artifact, import source, or requirements reference. Production application writes require an explicitly selected operational store and API boundary.

## Consequences

The project must evaluate storage governance, transactions, access control, audit, backup, retention, support, and cost before implementation.

---

## Source: `docs/decisions/ADR-005-standard-spa-first.md`

# ADR-005 — Use a standard SPA before microfrontends

Status: PROPOSED

## Context

The current product describes one internal application and does not establish independently deployed frontend teams or modules.

## Decision

Begin with a conventional React and TypeScript SPA. Do not introduce single-spa or another microfrontend framework without a verified independent-deployment requirement.

## Consequences

The initial architecture stays simpler. Modular boundaries should still be maintained so future evolution remains possible.

---

## Source: `docs/decisions/ADR-006-repository-as-project-memory.md`

# ADR-006 — Repository documentation is durable AI memory

Status: ACCEPTED

## Context

Chat sessions are isolated, temporary, and may use different AI products. Re-explaining the entire project is inefficient and error-prone.

## Decision

Version-controlled project files hold stable truth, current state, decisions, evidence, and handoffs. Chat is temporary task discussion.

## Consequences

Meaningful work includes context maintenance. AI assistants read the small entry files first and only load task-relevant source files afterward.

---

## Source: `docs/decisions/ADR-007-clean-one-way-handoff.md`

# ADR-007 — Use a clean one-way work-account handoff

Status: ACCEPTED

## Context

The personal planning environment and corporate environment must remain isolated.

## Decision

Transfer a sanitized content snapshot into a newly initialized work-owned repository without forking, personal Git history, or a personal remote. Work-derived changes never synchronize back to personal systems.

## Consequences

The work repository receives independent ownership and history. The transfer requires a sanitization review and verification of remotes before work-specific content is added.
