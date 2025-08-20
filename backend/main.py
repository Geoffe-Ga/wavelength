"""FastAPI backend providing self-care recommendations for each archetypal phase."""

from fastapi import FastAPI, HTTPException
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(title="Wavelength Backend")

# Allow local development requests from the SwiftUI app
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Hard-coded recommendations for the MVP
PHASE_RECOMMENDATIONS: dict[str, list[str]] = {
    "Restoration": [
        "Taking a Bath",
        "Getting some Sunshine",
        "Somatic Meditation",
        "Biking",
        "Dancing",
    ],
    "Rising": [
        "Wim Hof Method",
        "Dog Walkin Shamanism",
        "Deep Conversation",
        "Yoga",
        "Creative Writing",
    ],
    "Peaking": [
        "Magick",
        "Micro-Retreats",
        "Confidence Practice",
        "Kombucha",
        "Making Music",
    ],
    "Withdrawal": [
        "5-4-3-2-1 Technique",
        "Intense Exercise",
        "4/7/8 Breathing",
        "Box Breathing",
    ],
    "Diminishing": [
        "Long Drives",
        "Hot Beverages",
        "Walking",
        "Journaling",
    ],
    "Bottoming Out": [
        "Getting Comfy",
        "Drinking Water",
        "Listening to Music",
        "Lion's Breath",
    ],
}


@app.get("/phase/{name}")
async def get_phase(name: str) -> dict[str, list[str] | str]:
    """Return recommendations for a given phase.

    Parameters
    ----------
    name:
        Name of the phase provided by the watch app.

    """
    key = name.title()
    if key not in PHASE_RECOMMENDATIONS:
        raise HTTPException(status_code=404, detail="Unknown phase")

    return {"phase": key, "recommendations": PHASE_RECOMMENDATIONS[key]}


__all__ = ["app"]
