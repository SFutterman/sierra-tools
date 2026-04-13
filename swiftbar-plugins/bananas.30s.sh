#!/usr/bin/env bash
# 🍌 Banana Counter for SwiftBar
# Refreshes every 30 seconds

DATA_FILE="$HOME/.sierra/bananas.json"

if [ ! -f "$DATA_FILE" ]; then
  echo "🍌 0"
  echo "---"
  echo "No bananas yet! Run 'banana' in terminal."
  exit 0
fi

TODAY=$(date +%Y-%m-%d)

# Parse with python3 (always available on macOS)
read -r TODAY_COUNT PB TOTAL <<< $(python3 - <<'PYEOF'
import json, sys
from pathlib import Path

data = json.loads(Path.home().joinpath(".sierra/bananas.json").read_text())
today = __import__("datetime").date.today().isoformat()

today_count = sum(e["count"] for e in data["bananas"] if e["timestamp"].startswith(today))
pb = data.get("daily_high", 0)
total = sum(e["count"] for e in data["bananas"])
print(today_count, pb, total)
PYEOF
)

# Menubar line
if [ "$TODAY_COUNT" -ge "$PB" ] && [ "$PB" -gt 0 ]; then
  echo "🏆🍌 ${TODAY_COUNT}"
elif [ "$TODAY_COUNT" -gt 0 ]; then
  echo "🍌 ${TODAY_COUNT}"
else
  echo "🍌 0"
fi

echo "---"
echo "Today: ${TODAY_COUNT} 🍌"
echo "Personal Best: ${PB} 🍌"
echo "All-time: ${TOTAL} 🍌"
echo "---"
echo "Log a commit | bash=$HOME/.sierra/bin/banana terminal=false refresh=true"
echo "Log a PR (5🍌) | bash=$HOME/.sierra/bin/banana param1=pr terminal=false refresh=true"
echo "---"
echo "Open terminal for stats | bash=/usr/bin/open param1=-a param2=Terminal terminal=false"
