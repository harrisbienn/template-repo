# Data Handling Standard

## Default Rule

Do not commit real client data, credentials, or large generated outputs unless the repository is explicitly approved for that purpose.

## Prefer To Commit

- Synthetic fixtures.
- Schemas.
- Manifests.
- Checksums.
- Retrieval instructions.
- Small public examples with clear licenses.

## Prefer Not To Commit

- Raw client data.
- Personal information.
- Regulated data.
- Large binary files.
- Generated model outputs.
- Local cache folders.

## Provenance

When a workflow depends on data, document:

- Source.
- Retrieval date.
- License or usage constraints.
- Transformations performed.
- Expected file counts or checksums.
- Owner of the data refresh process.
