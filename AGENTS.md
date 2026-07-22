# Agent Instructions

This repository is a template. Preserve clarity over cleverness.

## Working Rules

- Read `README.md`, `CONTRIBUTING.md`, and relevant folder READMEs before making broad structural changes.
- Keep generated files, secrets, local data, and virtual environments out of Git.
- Prefer small, focused edits that preserve the template's ability to be reused.
- Use `rg` for searching when available.
- For Python changes, run `ruff check .`, `ruff format --check .`, and `pytest` when the environment supports it.
- For documentation-only changes, still check links, headings, and examples for consistency.

## Template Rules

- Do not replace placeholders with client-specific details unless the user asks.
- Do not add large sample datasets.
- Keep scripts thin; production logic belongs under `src/`.
- Keep CI generic enough that a new repository can adopt it with minimal edits.
