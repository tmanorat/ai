# Evidence

Store sanitized, reviewable evidence that supports capability, test, and acceptance claims.

Prefer small Markdown records using `templates/discovery-evidence.md`. Reference protected enterprise evidence rather than copying it when the repository is not approved for that content.

Every record should distinguish:

- Configuration evidence
- Authorization evidence
- End-user workflow evidence
- Remaining limitations

Never store secrets, tokens, sensitive screenshots, production data, or controlled information. Use `evidence/private/` only for local transient material; it is ignored by Git and still must comply with work policy.
