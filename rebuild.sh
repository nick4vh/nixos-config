#!/usr/bin/env bash

set -e

HOST="$1"

if [ -z "$HOST" ]; then
  echo "❌ Bitte gib einen Hostnamen an (z. B. ./rebuild.sh mein-pc)"
  exit 1
fi

echo "🔁 Rebuild für Host: $HOST..."
sudo nixos-rebuild switch --flake .#$HOST
echo "✅ Rebuild abgeschlossen für $HOST."
