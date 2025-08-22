#!/bin/bash

# Install SwiftLint if not already installed
if ! command -v swiftlint &> /dev/null; then
    echo "Installing SwiftLint..."
    if command -v brew &> /dev/null; then
        brew install swiftlint
    else
        curl -L -o swiftlint_linux.zip https://github.com/realm/SwiftLint/releases/download/0.59.1/swiftlint_linux.zip
        unzip -o swiftlint_linux.zip swiftlint -d swiftlint_bin
        install swiftlint_bin/swiftlint /usr/local/bin
        rm -rf swiftlint_bin swiftlint_linux.zip
    fi
fi

echo "🔧 Creating virtual environment..."
python3 -m venv .venv

echo "📦 Activating virtual environment..."
source .venv/bin/activate

echo "📚 Installing dependencies..."
pip install --upgrade pip
pip install -r backend/requirements.txt
pip install -r backend/requirements-dev.txt

echo "✅ Installing pre-commit hooks..."
pre-commit install
pre-commit autoupdate --repo https://github.com/pre-commit/pre-commit-hooks

echo "🎉 Setup complete! Your environment is ready."
echo ""
echo "Next steps:"
echo "  - Run 'source .venv/bin/activate' to enter the virtual environment."
echo "  - Run 'pytest' to test, or 'pre-commit run --all-files' to lint everything now."
