# Template Repository Strategy

A single template repository is useful for shared governance and fast project startup, but one template should not carry every possible stack forever.

## Recommended Approach

Use this repository as the organization baseline. It works especially well for Python, data, automation, and analytical projects.

Create specialized templates when repeated projects need materially different defaults.

## Recommended Template Portfolio

### `template-org-base`

Use for any new repository regardless of language.

Includes:

- README.
- Contributing guide.
- Security policy.
- Code of conduct.
- GitHub issue and pull request templates.
- Minimal CI.
- Documentation folders.

### `template-python-package`

Use for reusable libraries, command-line tools, internal packages, and scientific computing utilities.

Adds:

- `src/` package layout.
- `tests/` with pytest.
- Ruff configuration.
- Build and publish workflow.
- Release runbook.

### `template-data-workflow`

Use for analytics, GIS, modeling, ETL, reporting, and decision-support projects.

Adds:

- `data/` staging convention.
- `configs/` for parameterized workflows.
- `notebooks/`.
- `reports/`.
- Data manifests and provenance standards.
- Long-running workflow runbooks.

### `template-app-service`

Use for APIs, dashboards, internal tools, portals, and web apps.

Adds:

- Application framework starter.
- API contract docs.
- Container runtime.
- Health checks.
- Deployment workflow.
- Environment configuration templates.

### `template-infra`

Use for infrastructure modules and platform automation.

Adds:

- IaC-first layout.
- Policy checks.
- State management documentation.
- Environment promotion model.
- Rollback and incident runbooks.

### `template-client-delivery`

Use for client-specific delivery work where documentation, reports, and reproducibility are the primary product.

Adds:

- Deliverables folder.
- Assumptions log.
- Meeting notes convention.
- Client data handling statement.
- Review and delivery checklist.

## When To Split A Template

Create a specialized template when:

- Three or more repositories repeat the same setup work.
- CI needs are materially different.
- Review ownership and release workflows differ.
- The project type has unique compliance or data handling requirements.
- New contributors are confused by too many irrelevant folders.

## Governance Rule

All templates should share the same baseline expectations for security, pull requests, code review, documentation, and release notes.
