# BI Operations Application — AI Handoff Repository

This private repository is the portable source of truth for planning and building a centralized internal application that embeds governed Power BI analytics and adds native workflow and write-back capabilities.

It is designed to move cleanly into an isolated work account and to support Microsoft Foundry or another AI assistant that can read local files and use a Git MCP. Chat history is not project memory; this repository is.

## First use in the work environment

Open the repository in the company AI and send exactly:

> Initialize this repository by reading and executing `BOOTSTRAP.md` completely.

The bootstrap starts read-only, discovers the available environment, populates only allowlisted template sections, validates its work, and prepares a commit. It must not push without approval.

## Every task after bootstrap

Send:

> Continue from `STATE.md`. Task: ___

The assistant is instructed to finish each meaningful task by testing, reviewing the diff, updating `STATE.md`, and leaving a handoff.

## Start here

- Human or unknown AI tool: [`START_HERE.md`](START_HERE.md)
- One-time initialization: [`BOOTSTRAP.md`](BOOTSTRAP.md)
- Stable project truth: [`AI.md`](AI.md)
- Current handoff: [`STATE.md`](STATE.md)
- Clean work-account transfer: [`transfer/PERSONAL_TO_WORK.md`](transfer/PERSONAL_TO_WORK.md)
- Security boundary: [`SECURITY.md`](SECURITY.md)

This repository initially contains planning and operating context, not production application code. Application scaffolding begins only after the work environment and architecture gates are verified.
