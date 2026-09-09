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
