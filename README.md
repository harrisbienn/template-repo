# Organization Repository Template

This repository is a reusable starting point for engineering consultancy work. It is designed for teams that build a mix of analytical Python packages, data workflows, client-facing tools, internal automation, infrastructure, and technical documentation.

The template is intentionally opinionated about structure, quality gates, and operational documentation, but it is not meant to force every project into every folder. Start here, then remove the folders that do not apply before the first real commit.

## Quick Start

1. Create a new repository from this template.
2. Rename placeholder package/module names in `pyproject.toml`, `src/`, `tests/`, and documentation.
3. Delete folders that are not useful for the project.
4. Fill in ownership, support, and deployment details in `CONTRIBUTING.md`, `SECURITY.md`, and `docs/runbooks/`.
5. Enable branch protection in GitHub for the default branch.
6. Require the CI workflow in `.github/workflows/ci.yml` before merging pull requests.

For Python-oriented projects:

```powershell
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install --upgrade pip
python -m pip install -e ".[dev]"
pre-commit install
pytest
```

For non-Python projects, keep the repository governance and folder conventions, then replace the language-specific files with the appropriate build system.

## Repository Goals

This template is built around five practices that scale well in a mid-size engineering consultancy:

- Make source code, tests, infrastructure, documentation, and operating procedures easy to find.
- Keep generated outputs, client data, secrets, and local machine state out of Git.
- Make every change reviewable through pull requests, CI checks, and clear ownership.
- Preserve decision history with architecture decision records and runbooks.
- Keep project-specific logic in importable modules, with scripts and notebooks acting as thin workflow surfaces.

## Recommended Repository Layout

```text
.
|-- .github/                 GitHub automation, pull request templates, issue templates, CODEOWNERS
|-- .devcontainer/           Optional reproducible development container configuration
|-- assets/                  Small checked-in static assets used by docs, apps, or examples
|-- configs/                 Non-secret example configuration files and schemas
|-- data/                    Local data staging convention; data files are ignored by default
|-- docs/                    Architecture, decisions, runbooks, standards, and user/developer docs
|-- examples/                Small runnable examples, sample inputs, and demo workflows
|-- infra/                   Infrastructure as code, deployment manifests, and environment config
|-- notebooks/               Exploratory notebooks with clear promotion paths into source modules
|-- reports/                 Generated reports and delivery artifacts; large/generated files ignored
|-- scripts/                 Thin developer and operations scripts
|-- src/                     Production source code using the src-layout convention
|-- tests/                   Automated tests mirroring source and workflow boundaries
|-- tools/                   Developer tooling, code generation helpers, and local utilities
|-- .editorconfig            Consistent whitespace and line ending defaults
|-- .gitignore               Ignore rules for local state, data, outputs, caches, and secrets
|-- .pre-commit-config.yaml  Local quality checks before commits
|-- AGENTS.md                Instructions for AI coding agents working in this repository
|-- CHANGELOG.md             Human-readable release history
|-- CODE_OF_CONDUCT.md       Collaboration expectations
|-- CONTRIBUTING.md          Development workflow and pull request expectations
|-- LICENSE_TEMPLATE.md      Placeholder for choosing the right project license
|-- pyproject.toml           Python package and tooling configuration
|-- SECURITY.md              Vulnerability reporting and secret handling policy
```

## Folder Guide

### `.github/`

Contains GitHub-native workflow and collaboration configuration.

Put these files here:

- `workflows/ci.yml` for automated test, lint, and packaging checks.
- `dependabot.yml` for dependency update pull requests.
- `pull_request_template.md` for consistent PR descriptions.
- `ISSUE_TEMPLATE/` files for bugs, enhancements, support requests, and technical debt.
- `CODEOWNERS` for required reviewers by path.

Best practices:

- Require CI checks and at least one reviewer before merge.
- Prefer small pull requests with focused change descriptions.
- Use CODEOWNERS for high-risk areas such as infrastructure, security, production data flows, and release automation.
- Keep workflow secrets in GitHub Actions secrets or environment secrets, never in workflow files.

### `.devcontainer/`

Provides optional reproducible development environments for projects that benefit from containerized tooling.

Use this when:

- Developers need a consistent Linux toolchain.
- The project has complicated system dependencies.
- CI and local environments should be close to identical.

For Windows-heavy geospatial, HEC, desktop, or GPU workflows, a native Windows environment may be more realistic than a container. In those cases, document the native setup in `docs/runbooks/local-development.md` and keep `.devcontainer/` minimal or remove it.

### `assets/`

Stores small, stable, checked-in static assets.

Good candidates:

- Logos and diagrams used in documentation.
- Tiny sample images or icons used by examples.
- Static app assets that are truly source assets.

Avoid:

- Large media files.
- Generated figures.
- Client-confidential imagery unless the repository access model explicitly allows it.

### `configs/`

Stores versioned, non-secret configuration files.

Good candidates:

- Example YAML, TOML, JSON, or INI configs.
- Configuration schemas.
- Environment-specific templates such as `local.example.yaml`, `dev.example.yaml`, and `prod.example.yaml`.

Avoid:

- Passwords, tokens, private keys, client credentials, database URLs with credentials, or personal paths.
- Machine-specific configuration that cannot run elsewhere.

Recommended pattern:

- Commit `*.example.yaml` files.
- Document required environment variables beside the config.
- Validate configs with typed parsers, schema checks, or startup validation.

### `data/`

Defines the local data staging convention. Real data files are ignored by default.

Recommended subfolders:

- `data/raw/` for immutable source extracts, model inputs, exports, or received files.
- `data/interim/` for temporary normalized or partially processed data.
- `data/processed/` for deterministic processed datasets.
- `data/external/` for downloaded public reference datasets.
- `data/manifests/` for small metadata files that describe data provenance and checksums.

Best practices:

- Do not commit client data unless the repository is approved for that data classification.
- Prefer manifests, checksums, data dictionaries, and retrieval instructions over raw datasets.
- Treat `data/raw/` as immutable. If a transformation is needed, write to `data/interim/` or `data/processed/`.
- Store large reproducible outputs in object storage, release artifacts, or a data registry.

### `docs/`

Holds durable knowledge that should outlive individual pull requests.

Recommended subfolders:

- `docs/architecture/` for system context, component diagrams, interfaces, and design notes.
- `docs/decisions/` for architecture decision records.
- `docs/runbooks/` for repeatable operational procedures.
- `docs/standards/` for team conventions such as branching, releases, data handling, and coding style.

Best practices:

- Document why important decisions were made, not just what changed.
- Keep runbooks executable, with concrete commands and expected outputs.
- Link documentation from the README so new contributors can find it.

### `examples/`

Contains small, runnable examples that demonstrate intended use.

Good candidates:

- Minimal scripts showing library usage.
- Toy input files that are safe to commit.
- Demo notebooks or CLI command sequences.
- Example API requests and responses with fake data.

Avoid:

- Full client datasets.
- Examples that require hidden credentials.
- Duplicated production logic.

### `infra/`

Contains infrastructure as code and deployment configuration.

Good candidates:

- Terraform, Bicep, CloudFormation, Pulumi, or Helm charts.
- Dockerfiles and compose files when they describe runtime infrastructure.
- Kubernetes manifests.
- Deployment environment overlays.
- CI/CD deployment scripts that are not GitHub workflow YAML.

Best practices:

- Separate reusable modules from environment-specific configuration.
- Never commit cloud credentials or generated state files.
- Document how state is stored, who can apply changes, and how rollbacks work.
- Require code review from infrastructure owners.

### `notebooks/`

Stores exploratory or explanatory notebooks.

Recommended subfolders:

- `notebooks/exploration/` for early analysis.
- `notebooks/reports/` for narrative notebooks intended for review.
- `notebooks/archive/` for retained historical notebooks.

Best practices:

- Move reusable logic into `src/` once it stabilizes.
- Keep notebooks parameterized where possible.
- Clear large outputs before committing unless the output is the deliverable.
- Record the input data version or manifest used for any analysis.

### `reports/`

Holds generated reports and client delivery artifacts.

Good candidates:

- Small generated PDFs, HTML reports, figures, and tables when they are intentionally versioned.
- Report templates.
- Delivery checklists.

Avoid:

- Large generated output folders.
- Sensitive client deliverables in broadly visible repositories.

For most projects, generated reports should be reproducible from code and stored outside Git unless they are small and reviewable.

### `scripts/`

Contains thin scripts for developer convenience and operations.

Good candidates:

- `bootstrap.ps1` for setting up a local environment.
- `lint.ps1`, `test.ps1`, and `format.ps1`.
- One-off migration or maintenance scripts that call production modules.

Best practices:

- Scripts should orchestrate code in `src/`, not contain core business logic.
- Every script should be safe to run repeatedly or clearly document side effects.
- Prefer named command-line arguments over hidden positional assumptions.
- On Windows, use PowerShell scripts for local workflows and document any Bash-only equivalent separately.

### `src/`

Contains production source code.

For Python projects, use the `src` layout:

```text
src/
|-- package_name/
|   |-- __init__.py
|   |-- cli.py
|   |-- config.py
|   |-- core/
|   |-- io/
|   |-- services/
|   `-- py.typed
```

Why this layout is useful:

- Tests import the installed package instead of accidentally importing files from the working directory.
- Packaging behavior is closer to what users get after installation.
- It encourages clear module boundaries.

For non-Python projects, use the language-standard equivalent, such as `src/main`, `app`, `packages`, or `services`, and document that choice.

### `tests/`

Contains automated tests.

Recommended subfolders:

- `tests/unit/` for isolated logic.
- `tests/integration/` for file, database, API, cloud, or service boundaries.
- `tests/e2e/` for full workflow tests.
- `tests/fixtures/` for small deterministic test inputs.

Best practices:

- Keep fixtures small and synthetic unless real data is explicitly approved.
- Test behavior at module boundaries rather than private implementation details.
- Add regression tests for every bug fix.
- Mark slow, networked, or credentialed tests so CI can run the right subset.

### `tools/`

Stores developer tooling that is not product code.

Good candidates:

- Code generation helpers.
- Static analysis wrappers.
- Release note generation scripts.
- Repository maintenance utilities.

If a tool becomes part of the product runtime, move it into `src/`.

## File Guide

### `AGENTS.md`

Instructions for AI coding agents. Keep this concise and repository-specific. Include setup commands, test commands, safety notes, and project conventions that an agent should follow before editing.

### `CHANGELOG.md`

Human-readable release history. Use it to record user-facing changes, migration notes, and breaking changes. A good changelog is especially useful for client delivery and support.

### `CONTRIBUTING.md`

Development workflow. This should answer:

- How to set up the project.
- How to run tests and linting.
- How branches and pull requests work.
- What review quality looks like.
- How releases are cut.

### `SECURITY.md`

Security and vulnerability handling. This should answer:

- How to report vulnerabilities.
- What data must not be committed.
- How secrets are managed.
- How dependency and container vulnerabilities are handled.

### `pyproject.toml`

Python project metadata and tool configuration. This template uses modern Python packaging defaults, Ruff for linting/formatting, pytest for tests, and setuptools for packaging.

If the repository is not Python-based, replace `pyproject.toml` with the language-native equivalent, such as `package.json`, `pom.xml`, `build.gradle`, `go.mod`, or `.csproj`.

## DevOps Baseline

Every production or client-delivery repository should have:

- A default branch protected by required pull requests.
- CI that runs tests, linting, and dependency checks.
- Dependabot or equivalent dependency update automation.
- A documented release process.
- A documented rollback or recovery path for deployed systems.
- Clear owners for source, infrastructure, security-sensitive areas, and delivery artifacts.
- Secret scanning enabled at the GitHub organization level.
- Branch deletion after merge to reduce stale work.

Recommended branch model:

- `main` is always releasable.
- Feature branches use `feature/<short-name>`.
- Bug fixes use `fix/<short-name>`.
- Release branches are only used when the team actively supports multiple release lines.

Recommended pull request expectations:

- Describe the change and why it is needed.
- Link the issue, ticket, or client request.
- Include validation evidence, such as test commands or screenshots.
- Call out migrations, secrets, manual steps, and backward compatibility risks.
- Keep unrelated refactors out of feature PRs.

## Python Defaults

This template assumes Python 3.11 or newer for Python projects. Adjust `requires-python` in `pyproject.toml` if your deployment target requires another version.

Recommended local commands:

```powershell
python -m pip install -e ".[dev]"
ruff check .
ruff format --check .
pytest
```

Recommended CI stages:

- Install package with development dependencies.
- Run lint checks.
- Run format checks.
- Run tests.
- Build the package to catch packaging errors.

## Data And Secret Handling

Never commit:

- `.env` files with real values.
- Cloud credentials.
- SSH keys.
- API tokens.
- Client data that has not been approved for Git storage.
- Large generated outputs.
- Local virtual environments.
- Notebook checkpoints and local cache folders.

Commit instead:

- `.env.example` with fake values.
- Config templates.
- Data manifests.
- Checksums.
- Small synthetic fixtures.
- Reproducible scripts that can regenerate outputs.

## When A Single Template Is Enough

A single unified template is a good fit when the organization wants:

- One baseline for governance, CI, documentation, and security.
- Most repositories to be Python analytics, automation, or tooling projects.
- Teams to remove unused folders rather than choose among many starting points.
- A common consulting delivery structure across clients.

This repository works well as that baseline.

## When Multiple Template Repositories Are Better

A mid-size engineering consultancy will usually benefit from a small portfolio of templates instead of one giant template for everything.

Recommended template portfolio:

| Template | Best for | Key differences |
| --- | --- | --- |
| `template-org-base` | Governance-only starter for any repository | README, GitHub templates, security, contributing, docs, no language-specific source tree |
| `template-python-package` | Reusable Python libraries and CLIs | `src/`, `tests/`, `pyproject.toml`, release workflow, package build checks |
| `template-data-workflow` | Data engineering, analytics, GIS, modeling, notebooks | `data/`, `notebooks/`, `configs/`, manifests, provenance docs, larger fixture guidance |
| `template-app-service` | Web apps, APIs, dashboards, internal tools | App framework, service config, container runtime, health checks, deployment docs |
| `template-infra` | Infrastructure modules and platform automation | IaC-first layout, state docs, policy checks, environment promotion, rollback runbooks |
| `template-client-delivery` | Client-specific delivery repositories | Deliverables, reports, meeting notes, assumptions log, accepted data handling model |

Practical recommendation:

- Use this repository as `template-org-base` plus a Python/data workflow starter.
- Create specialized child templates only after two or three projects need the same extra files.
- Keep the governance files consistent across all templates.
- Avoid letting specialized templates drift on security, pull request, and CI expectations.

## Adapting This Template

Before first use:

1. Replace `package_name` placeholders.
2. Set the project license.
3. Update CODEOWNERS with real teams or users.
4. Choose the supported Python version or replace Python tooling entirely.
5. Decide which data classifications may be stored in the repository.
6. Define the release process in `docs/standards/branching-and-releases.md`.
7. Update this README so it describes the actual project, not the template.

The best template is not the one with the most folders. It is the one that makes the right next action obvious for a new contributor.
