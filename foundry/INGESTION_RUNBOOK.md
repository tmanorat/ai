# Optional Foundry Context Ingestion

Use this only when local repository reading is unavailable or unreliable, or when an approved non-repository knowledge source is required.

## Prepare

1. Update canonical repository documentation.
2. Review `foundry/KNOWLEDGE_MANIFEST.txt` and ensure every listed file is permitted for the target Foundry environment.
3. Run `scripts/build-foundry-context.ps1`.
4. Run `scripts/validate-context.ps1`.
5. Review `foundry/generated/FOUNDRY_CONTEXT.md` for sensitive or stale content.

## Configure

1. Use an approved Foundry project and knowledge/file-search configuration.
2. Confirm storage, region, retention, deletion, user isolation, logging, cost, and data classification.
3. Upload only the generated bundle or another explicit allowlist—not the entire repository by default.
4. Apply `foundry/AGENT_INSTRUCTIONS.md` as agent/system instructions where supported.
5. Wait for ingestion to complete.

## Verify

Run the retrieval fallback test in `foundry/CAPABILITY_PROBE.md`. Record the date, bundle version/digest if available, result, and limitations in the capability matrix.

## Refresh

Knowledge copies can become stale. Regenerate and reingest after material canonical documentation changes. The Git repository remains authoritative when it differs from an uploaded bundle.

## Cleanup

Follow approved procedures to delete superseded files, vector stores, conversations, or resources when required. Do not assume deletion or expiration behavior.
