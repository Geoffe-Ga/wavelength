"""Tests for the phase recommendation endpoint."""

from fastapi.testclient import TestClient

from backend.main import app

client = TestClient(app)


def test_get_phase_returns_recommendations() -> None:
    """Known phases return a list of recommendations."""
    response = client.get("/phase/Restoration")
    assert response.status_code == 200
    data = response.json()
    assert data["phase"] == "Restoration"
    assert len(data["recommendations"]) > 0


def test_get_phase_unknown_phase() -> None:
    """Unknown phase names return a 404 error."""
    response = client.get("/phase/Unknown")
    assert response.status_code == 404
