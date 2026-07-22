# Local Development Runbook

## Purpose

Set up a local development environment and run repository checks.

## Prerequisites

- Git.
- Python 3.11 or newer for Python projects.
- Access to any private package indexes, data stores, or cloud resources required by the project.

## Setup

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
pre-commit install
```

## Validate

```powershell
ruff check .
ruff format --check .
pytest
```

## Troubleshooting

- If imports fail, confirm the package was installed with `python -m pip install -e ".[dev]"`.
- If `pre-commit` is missing, reinstall development dependencies.
- If tests require data, confirm data is staged according to `data/README.md` and documented manifests.
