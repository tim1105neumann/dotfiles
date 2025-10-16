#!/bin/bash
set -e
echo "🚀 Setup gestartet…"

# --- macOS Defaults ---
if [ -f "./macos/macos_defaults.sh" ]; then
    echo "🖥 macOS Defaults setzen…"
    source ./macos/macos_defaults.sh
fi

# --- Brewfile ---
if [ -f "./Brewfile" ]; then
    echo "📦 Brewfile installieren…"
    brew bundle --file ./Brewfile
fi

# --- Developer-Folder ---
DEV_DIR="$HOME/Developer"
SUBDIRS=("ios" "htl" "web" "general")
echo "📁 Developer-Ordner erstellen…"
mkdir -p "$DEV_DIR"
for sub in "${SUBDIRS[@]}"; do
    mkdir -p "$DEV_DIR/$sub"
done

# --- Git Configs ---
echo "🔗 Git-Configs symlinken…"
GIT_CONFIGS=("git/.gitconfig" "git/.gitignore_global")
for src in "${GIT_CONFIGS[@]}"; do
    dest="$HOME/$(basename $src)"
    if [ -e "$dest" ]; then
        echo "⚠️ $dest existiert bereits, Backup wird erstellt…"
        mv "$dest" "$dest.backup"
    fi
    ln -s "$PWD/$src" "$dest"
    echo "✅ $dest → $src"
done

# --- Shell Configs ---
echo "🔗 Shell-Configs symlinken…"
for src in shell/*; do
    dest="$HOME/$(basename $src)"
    if [ -e "$dest" ]; then
        echo "⚠️ $dest existiert bereits, Backup wird erstellt…"
        mv "$dest" "$dest.backup"
    fi
    ln -s "$PWD/$src" "$dest"
    echo "✅ $dest → $src"
done

echo "🎉 Setup abgeschlossen!"
