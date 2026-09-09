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
