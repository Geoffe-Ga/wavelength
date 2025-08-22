"""Tests for the phase recommendation endpoint."""

import unittest

from fastapi.testclient import TestClient

from backend.main import PHASE_RECOMMENDATIONS, app


class PhaseEndpointTests(unittest.TestCase):
    """Ensure phase endpoints behave as expected."""

    def setUp(self) -> None:  # noqa: D401
        """Create a test client for the app."""
        self.client = TestClient(app)

    def test_get_phase_returns_recommendations(self) -> None:
        """Each defined phase returns a non-empty list of recommendations."""
        for phase in PHASE_RECOMMENDATIONS:
            with self.subTest(phase=phase):
                response = self.client.get(f"/phase/{phase}")
                self.assertEqual(response.status_code, 200)
                data = response.json()
                self.assertEqual(data["phase"], phase)
                self.assertTrue(
                    data["recommendations"], "Expected at least one recommendation"
                )

    def test_get_phase_unknown_phase(self) -> None:
        """Unknown phase names return a 404 error."""
        for phase in ["Unknown", "Nonexistent"]:
            with self.subTest(phase=phase):
                response = self.client.get(f"/phase/{phase}")
                self.assertEqual(response.status_code, 404)


if __name__ == "__main__":
    unittest.main()
