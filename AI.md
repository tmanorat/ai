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
