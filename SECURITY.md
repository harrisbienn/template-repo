# Security Policy

## Reporting Vulnerabilities

Report suspected vulnerabilities through the organization's approved security channel. Do not open public issues for sensitive vulnerabilities unless the repository maintainers have explicitly approved that process.

## Secret Handling

Never commit:

- API tokens.
- Cloud credentials.
- SSH private keys.
- Database passwords.
- `.env` files with real values.
- Client secrets or connection strings.

Use:

- GitHub Actions secrets for CI/CD.
- Environment-specific secret stores for deployed systems.
- `.env.example` files with fake values for local setup documentation.

## Data Handling

Before committing data, confirm:

- The repository is approved for that data classification.
- The data is necessary for source control.
- The data is small enough for Git.
- The data has no private, regulated, contractual, or export-controlled content unless explicitly approved.

Prefer synthetic fixtures, manifests, checksums, and retrieval instructions.

## Dependency Management

- Keep Dependabot or equivalent automation enabled.
- Review dependency updates for license, security, and compatibility impact.
- Pin production dependencies when reproducibility matters.
- Avoid unmaintained packages for security-sensitive workflows.
