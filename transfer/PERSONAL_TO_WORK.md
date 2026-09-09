# Clean Personal-to-Work Transfer

This is a one-way sanitized transfer. The work repository must have independent ownership and history.

## Before transfer

1. Confirm the source repository contains only material allowed by `SECURITY.md`.
2. Run `scripts/build-foundry-context.ps1` and `scripts/validate-context.ps1`.
3. Complete `transfer/SANITIZATION_CHECKLIST.md`.
4. Review the complete file list and Git diff.

## Create the work repository

1. Create a new empty private repository using the approved work Git provider and account.
2. Transfer the content snapshot through an approved method.
3. Do not fork the personal repository.
4. Do not copy the source `.git` directory.
5. Initialize fresh Git history in the work location.
6. Configure only the work-owned remote.
7. Verify the remote before the first push.
8. Run local validation and make the first work-owned commit.

If the approved transfer mechanism preserves a source remote or history, remove that linkage before adding work-specific content and verify the result. Follow company policy rather than improvising around restrictions.

## Verify isolation

- The work repository has a work-owned remote only.
- Its first commit is work-owned and contains the sanitized snapshot.
- No personal username, path, remote, or credential is configured in repository files.
- The personal repository cannot receive work changes automatically.
- The work repository's access controls and branch policy are active.

## Initialize the company AI

Open the local work repository and send:

> Initialize this repository by reading and executing `BOOTSTRAP.md` completely.

Review the resulting diff before authorizing a commit or push.

## After transfer

- Work-specific facts, code, evidence, and decisions stay in approved work systems.
- Never copy work changes back to the personal repository or personal AI.
- The personal repository remains only the original sanitized transfer package.
