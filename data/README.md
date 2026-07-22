# Data

This folder defines the local data staging convention. Data files are ignored by default.

Recommended layout:

```text
data/
|-- raw/        Immutable source data as received
|-- interim/    Temporary normalized or partially processed data
|-- processed/  Deterministic processed data
|-- external/   Downloaded public reference data
`-- manifests/  Small provenance, checksum, schema, and inventory files
```

Commit manifests, schemas, and tiny synthetic fixtures when useful. Do not commit client data, large datasets, secrets, or generated bulk outputs without explicit approval.
