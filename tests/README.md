# Tests

Store automated tests here.

Recommended layout:

```text
tests/
|-- unit/
|-- integration/
|-- e2e/
`-- fixtures/
```

Testing guidance:

- Mirror the boundaries of `src/`.
- Use small synthetic fixtures.
- Add regression tests for bug fixes.
- Mark slow, networked, or credentialed tests.
- Keep CI fast enough that teams trust it.
