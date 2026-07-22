# Scripts

Store thin developer and operations scripts here.

Scripts should:

- Call importable logic from `src/`.
- Accept explicit arguments.
- Be safe to rerun or clearly document side effects.
- Fail loudly on errors.
- Avoid embedding secrets or machine-specific paths.

Common scripts:

- `bootstrap.ps1`
- `lint.ps1`
- `test.ps1`
- `format.ps1`
- `build.ps1`
