# Infrastructure

Store infrastructure as code and deployment configuration here.

Examples:

- Terraform, Bicep, CloudFormation, or Pulumi.
- Docker and compose files for runtime infrastructure.
- Kubernetes manifests.
- Helm charts.
- Environment overlays.

Rules:

- Do not commit secrets or generated state files.
- Document state storage and permissions.
- Require review from infrastructure owners.
- Include rollback procedures in `docs/runbooks/`.
