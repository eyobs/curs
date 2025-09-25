#!/bin/bash
set -e

echo "=== Uninstalling Cursor AI and removing app-specific files ==="

# Remove .deb package if installed
if dpkg -l | grep -q "^ii\s\+cursor"; then
    echo "Removing Cursor AI package (.deb)..."
    sudo apt remove --purge cursor -y
else
    echo "Cursor package not found via dpkg."
fi

# Remove user config, cache, and data directories (Cursor app-specific)
echo "Removing Cursor config and data folders..."
rm -rf "$HOME/.config/Cursor"
rm -rf "$HOME/.cache/Cursor"
rm -rf "$HOME/.local/share/Cursor"

# Remove cursor binaries if installed in usual places
echo "Removing Cursor binaries if present..."
sudo rm -f /usr/local/bin/cursor || true
rm -f "$HOME/.local/bin/cursor" || true

# Remove Cursor installation directory if exists
if [ -d "/opt/cursor" ]; then
    echo "Removing /opt/cursor installation directory..."
    sudo rm -rf /opt/cursor
fi

# Remove desktop entries related to Cursor AI
echo "Removing desktop entries related to Cursor AI..."
find "$HOME/.local/share/applications" -maxdepth 1 -type f -name "*cursor*.desktop" -exec rm -f {} +

echo "=== Cursor AI uninstalled and cleaned successfully ==="
