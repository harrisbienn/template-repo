# Release Runbook

## Purpose

Publish a reviewed, reproducible release.

## Checklist

1. Confirm all required pull requests are merged.
2. Confirm CI passes on `main`.
3. Update `CHANGELOG.md`.
4. Verify version numbers in project metadata.
5. Build artifacts locally or in CI.
6. Tag the release.
7. Publish artifacts through the approved channel.
8. Record deployment, delivery, or rollback notes.

## Python Build Check

```powershell
python -m pip install build
python -m build
```

## Rollback

Document the project-specific rollback process before the first production release.
