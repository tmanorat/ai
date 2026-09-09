# Ownership Boundaries

| Area | Primary owner |
|---|---|
| Semantic model, relationships, measures, DAX | BI team |
| Power BI pages, visuals, slicers, bookmarks, drill-through, tooltips | BI team |
| Analytical report UX and report testing | BI team |
| SPA navigation, panels, forms, drawers, and application state | Application team |
| Power BI embedding wrapper and event translation | Application team with BI contract |
| Backend/API, authorization, validation, and audit | Application team |
| Notes, assignments, status, and workflow persistence | Application/platform team |
| Email and enterprise integrations | Application/platform team with service owners |
| Identity, hosting, network, secrets, and CI/CD controls | Platform/security owners |
| Data classification and approval | Authorized governance owners |

## Boundary rule

Power BI owns analysis. The application owns actions. The backend owns trusted writes and enforcement.

Cross-boundary contracts—especially selected-record identity, authorization, and refresh behavior—must be explicit and tested.
