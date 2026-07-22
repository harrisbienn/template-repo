Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

ruff check .
ruff format --check .
