# ADR-001 — Separate analytics from application workflow

Status: PROPOSED

## Context

Power BI is effective for governed analytics, while the product also requires notes, assignments, email drafting, status changes, forms, and history.

## Decision

Power BI owns analytics and report UX. The SPA owns operational interaction. The backend/API owns trusted writes, authorization, validation, and integrations.

## Consequences

BI developers retain their primary toolset and ordinary report changes do not require frontend regeneration. Cross-layer contracts must be designed and tested.
