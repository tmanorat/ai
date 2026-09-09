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
