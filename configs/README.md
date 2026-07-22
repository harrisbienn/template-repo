# Configs

Store non-secret, versioned configuration here.

Recommended contents:

- `*.example.yaml` files with fake values.
- JSON Schema, Pydantic models, or other validation references.
- Environment templates for local, development, staging, and production.

Rules:

- Never commit secrets.
- Prefer relative paths in examples.
- Document required environment variables.
- Validate configuration at application startup or workflow entry points.
