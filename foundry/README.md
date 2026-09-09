# Microsoft Foundry Adapter

The preferred live-development mode is local repository access plus Git MCP:

```text
Company AI
  ├── local file tools → read and edit
  └── Git MCP → inspect, branch, diff, commit, and approved remote actions
```

Foundry knowledge/file search is a fallback for sessions that cannot reliably read the local repository or for approved external reference documents. It is not the primary source of rapidly changing code.

## Files

- `AGENT_INSTRUCTIONS.md`: system/agent instructions for the company AI
- `CAPABILITY_PROBE.md`: read-only-first capability discovery
- `LOCAL_AGENT_PROFILE.md`: environment-specific results populated during bootstrap
- `KNOWLEDGE_MANIFEST.txt`: allowlist used to generate the portable context bundle
- `INGESTION_RUNBOOK.md`: optional upload and verification procedure
- `generated/FOUNDRY_CONTEXT.md`: generated single-file bundle; do not edit manually

Rebuild and validate from the repository root:

```powershell
./scripts/build-foundry-context.ps1
./scripts/validate-context.ps1
```
