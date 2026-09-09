# ADR-003 — Prefer a canonical/shared semantic model

Status: PROPOSED

## Context

Overlapping reports currently use similar semantic models that have diverged through local changes.

## Decision

Converge duplicated business logic into a governed canonical semantic model where practical, with thin reports consuming it.

## Consequences

This reduces drift but requires inventory, comparison, business-owner validation, migration sequencing, and regression testing. Genuine domain boundaries may justify more than one governed model.
