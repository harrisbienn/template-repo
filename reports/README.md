# Reports

Use this folder for report templates and intentionally versioned delivery artifacts.

Recommended layout:

```text
reports/
|-- templates/   Reusable report templates
`-- generated/   Local generated reports, ignored by Git by default
```

Generated reports should usually be reproducible from source code, configuration, and documented data inputs.
