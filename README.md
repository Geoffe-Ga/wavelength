# 🤖 AI-Ready Python Template

This is a streamlined, batteries-included Python template designed for coding *with* AI assistants.

Whether you're pair-programming with ChatGPT, GitHub Copilot, Cursor, Claude, or any custom agent, this repo scaffolds your environment with best practices—so you and your coding companion can move fast *without* breaking things.

## ✨ Features

- **Agent-friendly structure** – Optimized for clarity and fast comprehension
- **Static typing** – [`mypy`](https://mypy-lang.org/) pre-configured
- **Formatting & linting** – [`black`](https://black.readthedocs.io/), [`isort`](https://pycqa.github.io/isort/), and [`ruff`](https://docs.astral.sh/ruff/)
- **Testing** – [`pytest`](https://docs.pytest.org/) support with 90%+ coverage expectations
- **Pre-commit hooks** – Enforce quality *before* you push
- **Minimal magic** – No weird abstractions or opinionated frameworks
- **Setup Scripts** - Tell your agent how to configure its environment to work on your project
- **AGENTS.md** - Canonical file to tell your Agent assistant how to interact with your codebase. This one uses Test Driven Development frameworks and explicit best practice instructions that minimize errors and maximize "one-shot" potential.

## 🛠️ Setup

```bash
git clone https://github.com/Geoffe-Ga/py-agent-coding-template.git
cd py-agent-coding-template
chmod +x dev-setup.sh
./dev-setup.sh
