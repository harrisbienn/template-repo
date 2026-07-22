# Repository Structure Standard

Use predictable folder names so contributors can move between projects without relearning the basics.

## Required For Most Repositories

- `README.md`
- `CONTRIBUTING.md`
- `SECURITY.md`
- `.github/`
- `docs/`
- `tests/` when code exists

## Recommended For Python Repositories

- `src/`
- `pyproject.toml`
- `.pre-commit-config.yaml`
- `scripts/`

## Recommended For Data Or Modeling Repositories

- `configs/`
- `data/`
- `notebooks/`
- `reports/`
- `docs/runbooks/data-refresh.md`

## Recommended For Deployed Systems

- `infra/`
- `docs/runbooks/deployment.md`
- `docs/runbooks/incident-response.md`
- Environment-specific configuration templates.

## Folder Removal Rule

Delete folders that do not apply. A smaller accurate repository is better than a large empty one.
