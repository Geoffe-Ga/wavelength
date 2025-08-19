"""Smoke test! Agents: Delete and replace this doc-string when beginning coding."""

from backend.main import hello_world


def test_smoke() -> None:
    """Necessary to get tests to pass with 100% coverage for pytest-cov."""
    assert hello_world() == "hello world"
