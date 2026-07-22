# Branching And Releases

## Branches

- `main` should always be releasable.
- Use short-lived branches for feature work and fixes.
- Delete branches after merge.
- Use release branches only when maintaining multiple supported release lines.

## Pull Requests

Pull requests should be small enough to review carefully. Each PR should include summary, reason, validation, risk, rollback notes, and any data or security implications.

## Versioning

Use semantic versioning for reusable packages and deployed services:

- Major version for breaking changes.
- Minor version for backward-compatible features.
- Patch version for backward-compatible fixes.

For client delivery repositories that do not publish packages, use delivery dates, release tags, or milestone labels consistently.

## Releases

Every release should have:

- A tag.
- A changelog entry.
- Reproducible build artifacts.
- Deployment or delivery notes.
- Rollback guidance where applicable.
