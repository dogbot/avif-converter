#!/bin/bash

# AVIF Converter - Installer Script
# Installs Finder Quick Actions for AVIF image conversion

set -e

echo "=========================================="
echo "AVIF Converter - Installation"
echo "=========================================="
echo ""

# Check if workflows exist
if [ ! -d "workflows/Convert to AVIF.workflow" ] || [ ! -d "workflows/Convert from AVIF.workflow" ]; then
    echo "❌ Error: Workflow files not found."
    echo "Please run this script from the AVIF Converter directory."
    exit 1
fi

# Create Services directory if it doesn't exist
SERVICES_DIR="$HOME/Library/Services"
mkdir -p "$SERVICES_DIR"

# Install workflows
echo "📦 Installing Quick Actions..."
cp -R "workflows/Convert to AVIF.workflow" "$SERVICES_DIR/"
cp -R "workflows/Convert from AVIF.workflow" "$SERVICES_DIR/"
echo "✅ Quick Actions installed to ~/Library/Services/"
echo ""

# Check for libavif
echo "🔍 Checking for libavif installation..."
if command -v avifenc &> /dev/null && command -v avifdec &> /dev/null; then
    echo "✅ libavif is installed and ready"
    AVIFENC_PATH=$(command -v avifenc)
    echo "   Location: $AVIFENC_PATH"
else
    echo "⚠️  libavif is NOT installed"
    echo ""
    echo "To use AVIF Converter, you need to install libavif:"
    echo ""
    echo "  Option 1 - Homebrew (recommended):"
    echo "    brew install libavif"
    echo ""
    echo "  Option 2 - Download pre-built binaries:"
    echo "    https://github.com/AOMediaCodec/libavif/releases"
    echo ""
fi

echo ""
echo "=========================================="
echo "Installation Complete!"
echo "=========================================="
echo ""
echo "To use:"
echo "  1. Right-click any image in Finder"
echo "  2. Go to Quick Actions (or Services)"
echo "  3. Select 'Convert to AVIF' or 'Convert from AVIF'"
echo ""
echo "Note: You may need to restart Finder or log out/in"
echo "      for the Quick Actions to appear."
echo ""
echo "To restart Finder:"
echo "  killall Finder"
echo ""
