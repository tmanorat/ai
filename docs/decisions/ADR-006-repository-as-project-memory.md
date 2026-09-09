# ADR-006 — Repository documentation is durable AI memory

Status: ACCEPTED

## Context

Chat sessions are isolated, temporary, and may use different AI products. Re-explaining the entire project is inefficient and error-prone.

## Decision

Version-controlled project files hold stable truth, current state, decisions, evidence, and handoffs. Chat is temporary task discussion.

## Consequences

Meaningful work includes context maintenance. AI assistants read the small entry files first and only load task-relevant source files afterward.
