# 0001 Use Src Layout For Python Projects

## Status

Accepted for Python repositories created from this template.

## Context

Python projects can place importable packages either at the repository root or under `src/`. Root-level packages are simple, but tests may accidentally import local files that are not installed the same way users receive the package.

## Decision

Python projects should place importable production code under `src/`.

## Consequences

- Tests exercise installed package behavior more reliably.
- Packaging issues are caught earlier.
- Contributors have a clear separation between production code, tests, scripts, notebooks, and documentation.
- Very small scripts may feel slightly more structured than necessary, but the consistency is worth it for team repositories.
