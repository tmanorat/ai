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
