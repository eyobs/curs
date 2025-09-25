#!/bin/bash
set -e

echo "=== Installing latest Cursor AI AppImage ==="

# Create local bin folder if missing
mkdir -p "$HOME/.local/bin"

# Download latest Cursor AppImage with platform specified
curl -L "https://www.cursor.so/api/download?platform=linux" -o "$HOME/.local/bin/cursor"
chmod +x "$HOME/.local/bin/cursor"

# Create desktop entry
mkdir -p "$HOME/.local/share/applications"
cat > "$HOME/.local/share/applications/cursor.desktop" <<EOF
[Desktop Entry]
Name=Cursor AI
Exec=$HOME/.local/bin/cursor
Icon=utilities-terminal
Type=Application
Categories=Development;
EOF

echo "✅ Cursor AI installed successfully!"
echo "Run it via your app launcher or: $HOME/.local/bin/cursor"
