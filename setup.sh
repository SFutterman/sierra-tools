#!/usr/bin/env bash
# sierra-tools setup
# Run once after cloning to wire everything up.
set -e

SIERRA_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$SIERRA_DIR/bin"
SWIFTBAR_PLUGINS="$SIERRA_DIR/swiftbar-plugins"

echo ""
echo "🍌  sierra-tools setup"
echo ""

# --- bananas.json ---
BANANAS_FILE="$SIERRA_DIR/bananas.json"
if [ ! -f "$BANANAS_FILE" ]; then
  echo '{"bananas": [], "daily_high": 0}' > "$BANANAS_FILE"
  echo "✅  Created bananas.json"
else
  echo "✅  bananas.json already exists"
fi

# --- Make bin scripts executable ---
chmod +x "$BIN_DIR"/*
chmod +x "$SWIFTBAR_PLUGINS"/*.sh
echo "✅  Scripts marked executable"

# --- PATH setup ---
SHELL_RC=""
if [ -f "$HOME/.zshrc" ]; then
  SHELL_RC="$HOME/.zshrc"
elif [ -f "$HOME/.bashrc" ]; then
  SHELL_RC="$HOME/.bashrc"
fi

PATH_LINE="export PATH=\"$BIN_DIR:\$PATH\""
if [ -n "$SHELL_RC" ] && ! grep -q "$BIN_DIR" "$SHELL_RC"; then
  echo "" >> "$SHELL_RC"
  echo "# sierra-tools" >> "$SHELL_RC"
  echo "$PATH_LINE" >> "$SHELL_RC"
  echo "✅  Added $BIN_DIR to PATH in $SHELL_RC"
  echo "    Run: source $SHELL_RC"
else
  echo "✅  PATH already configured (or no shell rc found)"
fi

# --- SwiftBar ---
if [ ! -d "/Applications/SwiftBar.app" ]; then
  echo ""
  echo "⚠️   SwiftBar not found. Install it:"
  echo "    brew install --cask swiftbar"
  echo "    Then open SwiftBar and point it at: $SWIFTBAR_PLUGINS"
else
  echo "✅  SwiftBar installed"
  echo "    Point SwiftBar at: $SWIFTBAR_PLUGINS"
  echo "    (Open SwiftBar → Cmd+Shift+G → paste the path above)"
fi

echo ""
echo "🐒  Done! Try: banana"
echo ""
