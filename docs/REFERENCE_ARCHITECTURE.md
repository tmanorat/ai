# Reference Architecture

Status: proposed reference architecture pending work-environment validation.

```text
Internal user
     │
     ▼
React + TypeScript SPA
     ├── Navigation and application state
     ├── Embedded Power BI reports
     └── Native actions, forms, details, and history
                  │
          selected record context
                  │
                  ▼
             Backend/API
        ├── Authorization
        ├── Validation
        ├── Workflow
        ├── Audit
        └── Approved integrations
                  │
                  ▼
       Governed operational store

Power BI reports ──► canonical semantic model ──► source systems
```

## Primary flows

### Analytics

Source systems feed a governed semantic model. Thin Power BI reports provide analytical experiences and are embedded in the application shell.

### Selected-record action

1. A user selects a record in Power BI.
2. A verified client event provides a stable entity identifier and context.
3. The SPA opens a native action panel.
4. The backend revalidates identity, authorization, and authoritative data.
5. The action is stored with actor, time, entity, and audit information.

Do not trust client event payloads as authorization or authoritative business data.

### Immediate note display

After a note is saved, the SPA retrieves it from the operational API. Power BI may ingest notes later for analytics on its normal refresh schedule.

## Environment progression

```text
Power BI: DEV workspace → TEST workspace → PROD workspace
Web/API:  feature branch → review → test deployment → production deployment
```

Exact hosting, authentication, embedding, storage, and CI/CD products remain open decisions.
