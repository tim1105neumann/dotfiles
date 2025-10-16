#!/bin/bash

set -e

echo "🚀 Setze macOS Defaults…"
if [ -f "./macos_defaults.sh" ]; then
    source ./macos_defaults.sh
else
    echo "⚠️ macos_defaults.sh nicht gefunden!"
fi

echo "📦 Installiere Pakete aus Brewfile…"
if [ -f "./Brewfile" ]; then
    brew bundle --file ./Brewfile
else
    echo "⚠️ Brewfile nicht gefunden!"
fi

echo "📁 Erstelle Developer-Ordnerstruktur…"
DEV_DIR="$HOME/Developer"
SUBDIRS=("ios" "htl" "web" "general")

mkdir -p "$DEV_DIR"

for sub in "${SUBDIRS[@]}"; do
    mkdir -p "$DEV_DIR/$sub"
done

echo "✅ Setup abgeschlossen! Developer-Ordner: $DEV_DIR"
