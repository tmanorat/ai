# Repository Security Policy

## Purpose

This repository crosses from a personal planning environment into an enterprise/government-contractor environment. The transfer must be one-way and sanitized.

## Allowed in the personal transfer repository

- Generic product goals and architecture patterns
- Sanitized requirements without employer, customer, program, or contract identifiers
- Templates, checklists, scripts, and placeholders
- Publicly documented technology names
- Synthetic examples

## Prohibited in the personal transfer repository

- Credentials, access tokens, keys, certificates, cookies, or connection strings
- Tenant, subscription, account, server, database, workspace, or internal repository identifiers
- Internal URLs, network diagrams, hostnames, or screenshots
- Real operational, personnel, financial, customer, or production data
- CUI, ITAR-controlled, export-controlled, classified, or contract-restricted information
- Proprietary source code or documents copied from the work environment
- Security findings or system configurations not approved for external storage

## Work-environment rule

After the clean transfer, work-specific facts and implementation stay in the work-owned repository and approved enterprise systems. Never synchronize them back to this personal repository or a personal AI account.

## AI and tool rule

- A tool being visible does not establish authorization.
- Begin new connections and capability checks read-only.
- Record only sanitized evidence.
- Do not expose secrets in prompts, logs, commits, screenshots, or tool output.
- Require approval for external connections, permission expansion, deployments, and production changes.
- Validate Foundry storage, retention, region, user isolation, and data classification before uploading sensitive files.

## Incident response

If prohibited information is found, stop work, do not propagate it, and follow the organization's incident and repository-history remediation process. Do not attempt destructive history rewriting without authorized security guidance.
