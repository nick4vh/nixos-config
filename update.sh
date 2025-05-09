#!/usr/bin/env bash

set -e

HOST="$1"

if [ -z "$HOST" ]; then
  echo "❌ Bitte gib einen Hostnamen an (z. B. ./update.sh mein-pc)"
  exit 1
fi

echo "⬆️  Aktualisiere Flake-Inputs..."
nix flake update

echo "🔁 Rebuild für Host: $HOST..."
sudo nixos-rebuild switch --flake .#$HOST
echo "✅ System ist aktualisiert für $HOST."
