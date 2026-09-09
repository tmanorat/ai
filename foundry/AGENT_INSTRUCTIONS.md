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
