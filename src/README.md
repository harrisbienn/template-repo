# Source

Store production source code here.

For Python projects, use a package under `src/`:

```text
src/
`-- package_name/
    |-- __init__.py
    |-- cli.py
    |-- config.py
    |-- core/
    |-- io/
    |-- services/
    `-- py.typed
```

Keep business logic, reusable workflow logic, and domain behavior in importable modules. Scripts, notebooks, APIs, and apps should call this code rather than copying it.
