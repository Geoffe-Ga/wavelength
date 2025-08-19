#!/bin/bash

# Install SwiftLint
if ! command -v swiftlint &> /dev/null
then
    echo "Installing SwiftLint via Homebrew..."
    brew install swiftlint
fi

echo "🔧 Creating virtual environment..."
python3 -m venv .venv

echo "📦 Activating virtual environment..."
source .venv/bin/activate

echo "📚 Installing development dependencies..."
pip install --upgrade pip
pip install -r backend/requirements.txt

echo "✅ Installing pre-commit hooks..."
pre-commit install
pre-commit autoupdate --repo https://github.com/pre-commit/pre-commit-hooks

echo "🎉 Setup complete! Your environment is ready."
echo ""
echo "Next steps:"
echo "  - Run 'source .venv/bin/activate' to enter the virtual environment."
echo "  - Run 'pytest' to test, or 'pre-commit run --all-files' to lint everything now."
