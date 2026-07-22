# Contributing

This guide defines the default development workflow for repositories created from this template.

## Development Flow

1. Create an issue, ticket, or short written intent for non-trivial work.
2. Create a branch from `main`.
3. Make focused changes with tests and documentation.
4. Run local checks.
5. Open a pull request using the PR template.
6. Address review feedback.
7. Merge only after required checks pass.

## Branch Naming

Use concise branch names:

- `feature/<short-description>`
- `fix/<short-description>`
- `docs/<short-description>`
- `chore/<short-description>`

## Local Setup

For Python projects:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
pre-commit install
```

If the repository is not Python-based, replace this section with the project's real setup commands.

## Local Checks

Run the same checks CI runs:

```powershell
ruff check .
ruff format --check .
pytest
```

For documentation-only changes, run the relevant documentation build or at least validate links and examples.

## Pull Request Expectations

Every pull request should include:

- A clear summary of what changed.
- The reason for the change.
- Validation evidence, such as tests run or screenshots.
- Any migration, deployment, or rollback notes.
- Any security, privacy, or data handling implications.

## Review Standards

Reviewers should prioritize:

- Correctness and regression risk.
- Security and secret handling.
- Data classification and client confidentiality.
- Maintainability and readability.
- Test coverage proportional to risk.
- Operational clarity for deployment or support.

## Release Notes

Update `CHANGELOG.md` for user-facing changes, breaking changes, and operational changes. Internal refactors that do not affect users may be omitted unless they help future maintainers.
