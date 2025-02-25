#!/bin/bash
#
# Installation script for TerminalGenius
# A lightweight terminal AI assistant for Ubuntu
#

set -e  # Exit on error

echo "============================================="
echo "  TerminalGenius Installation"
echo "  Lightweight AI Assistant for Ubuntu"
echo "============================================="

# Check if Python 3.8+ is installed
if ! command -v python3 &>/dev/null; then
    echo "Python 3 is not installed. Installing..."
    sudo apt update
    sudo apt install -y python3 python3-pip python3-venv
fi

PY_VERSION=$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')
REQUIRED_VERSION="3.8"

if [[ $(echo -e "$PY_VERSION\n$REQUIRED_VERSION" | sort -V | head -n1) != "$REQUIRED_VERSION" ]]; then
    echo "Python $PY_VERSION detected. TerminalGenius requires Python 3.8+."
    echo "Installing newer Python version..."
    sudo apt update
    sudo apt install -y python3.8 python3.8-venv python3-pip
else
    echo "Python $PY_VERSION detected. Continuing..."
fi

# Create installation directory
INSTALL_DIR="$HOME/.terminalgenius"
mkdir -p "$INSTALL_DIR"
echo "✅ Created installation directory: $INSTALL_DIR"

# Create virtual environment
echo "🔧 Setting up Python virtual environment..."
python3 -m venv "$INSTALL_DIR/venv"
source "$INSTALL_DIR/venv/bin/activate"

# Install required packages
echo "📦 Installing required dependencies..."
pip install --upgrade pip
pip install google-generativeai click requests fuzzywuzzy python-dotenv python-Levenshtein rich

# Move Python script (assuming you have it in the current directory)
if [ -f "TerminalGenius.py" ]; then
    echo "📂 Moving TerminalGenius.py to $INSTALL_DIR"
    mv TerminalGenius.py "$INSTALL_DIR/"
else
    echo "⚠️  TerminalGenius.py not found in current directory! Please move it manually."
fi

# Create .env file for API key
ENV_FILE="$INSTALL_DIR/.env"
if [ ! -f "$ENV_FILE" ]; then
    echo "🔑 Creating .env file for API key configuration..."
    cat > "$ENV_FILE" <<EOF
# Google Gemini API Key
# Get your API key from https://ai.google.dev/
GEMINI_API_KEY=AIzaSyAr9JwDNHq74L44jGzwfPTyxvryraogMb4
EOF
    echo "⚠️  Please update $ENV_FILE with your actual GEMINI API key!"
fi

# Create executable launcher
echo "🚀 Creating executable launcher..."
cat > "$INSTALL_DIR/terminalgenius" <<EOF
#!/bin/bash
source "$INSTALL_DIR/venv/bin/activate"
python3 "$INSTALL_DIR/TerminalGenius.py" "\$@"
EOF

# Make launcher executable
chmod +x "$INSTALL_DIR/terminalgenius"

# Create symbolic link
echo "🔗 Creating symbolic link in /usr/local/bin..."
sudo ln -sf "$INSTALL_DIR/terminalgenius" /usr/local/bin/tg

echo "============================================="
echo "✅ Installation complete!"
echo "============================================="
echo ""
echo "🎯 To use TerminalGenius:"
echo "1️⃣  Edit $INSTALL_DIR/.env and add your Google Gemini API key"
echo "2️⃣  Run 'tg' from anywhere in your terminal"
echo ""
echo "🚀 Quick start commands:"
echo "  tg ask 'How do I find large files in Linux?'"
echo "  tg find 'pattern'"
echo "  tg so 'Python pandas groupby'"
echo "  tg config --list"
echo ""
echo "🔍 For more information, run: tg --help"
echo "============================================="
