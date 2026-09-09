# ADR-007 — Use a clean one-way work-account handoff

Status: ACCEPTED

## Context

The personal planning environment and corporate environment must remain isolated.

## Decision

Transfer a sanitized content snapshot into a newly initialized work-owned repository without forking, personal Git history, or a personal remote. Work-derived changes never synchronize back to personal systems.

## Consequences

The work repository receives independent ownership and history. The transfer requires a sanitization review and verification of remotes before work-specific content is added.
