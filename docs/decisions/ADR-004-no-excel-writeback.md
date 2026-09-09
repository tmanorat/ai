# ADR-004 — Do not use Excel as production write-back

Status: ACCEPTED

## Context

Excel enabled a useful prototype but is not the intended governed transactional store for concurrent notes, assignments, status, and audit history.

## Decision

Excel may remain a prototype artifact, import source, or requirements reference. Production application writes require an explicitly selected operational store and API boundary.

## Consequences

The project must evaluate storage governance, transactions, access control, audit, backup, retention, support, and cost before implementation.
