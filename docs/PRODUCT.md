# Product

## Requirement statement

Build a centralized internal application that hosts governed Power BI analytics and adds native workflow and write-back capabilities around them.

## Problem

Several Power BI dashboards cover largely the same business subject area. Their semantic models have diverged through incremental additions and local logic. A prior AI-generated HTML tool demonstrated useful workflows but depends on an Excel snapshot and code generation that would be expensive and difficult for BI developers to maintain.

## Intended users

- BI developers who continue to own semantic models, DAX, reports, and analytical UX
- Internal users who need analytics plus record-level actions
- Application developers who own the web shell, APIs, workflow, integrations, and delivery pipeline
- Platform, security, and governance owners who approve enterprise capabilities

## Product direction

The centralized application provides navigation and operational workflows around embedded Power BI reports. Normal report changes remain Power BI changes and should not require regenerating frontend code.

Potential application functions include:

- Select a business record and open an action panel
- Add and retrieve notes immediately
- Assign responsibility
- Change workflow status
- Generate a reviewable email draft
- View details and history
- Navigate among governed analytical sections

## Non-goals

- Rebuilding standard Power BI visuals in JavaScript
- Forcing every report into one giant PBIX
- Making BI developers maintain large amounts of frontend code
- Using Excel as the production transactional store
- Using AI as production runtime infrastructure
- Choosing unverified commercial-cloud features for a sovereign environment

## Success

A BI developer can publish an ordinary report change without changing the SPA. A user can select a real record in an embedded report, perform an authorized native action, and immediately retrieve the resulting operational record with actor and time recorded.
