#!/usr/bin/env bash
set -e
FLUTTER_SDK="$HOME/.dev/flutter"
PATCH="$HOME/my_flutter_template.patch"

if [ -f "$PATCH" ]; then
  cd "$FLUTTER_SDK"
  git apply --ignore-space-change --ignore-whitespace "$PATCH" || echo "⚠️ Patch conflict, check manually"
else
  echo "❌ Patch not found"
fi
