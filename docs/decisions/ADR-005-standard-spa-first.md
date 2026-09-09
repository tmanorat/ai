# ADR-005 — Use a standard SPA before microfrontends

Status: PROPOSED

## Context

The current product describes one internal application and does not establish independently deployed frontend teams or modules.

## Decision

Begin with a conventional React and TypeScript SPA. Do not introduce single-spa or another microfrontend framework without a verified independent-deployment requirement.

## Consequences

The initial architecture stays simpler. Modular boundaries should still be maintained so future evolution remains possible.
