#!/usr/bin/env bash

PALETTE_JSON="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../palette.json"

SELECTED_THEME="$(tmux show-option -gv @catppuccin_flavor 2>/dev/null)"
TRANSPARENT_THEME="$(tmux show-option -gv @catppuccin_transparent 2>/dev/null)"

# Default to mocha
flavor="${SELECTED_THEME:-mocha}"

# Load colors from official catppuccin/palette JSON
declare -A THEME
while IFS='=' read -r key value; do
  THEME["$key"]="$value"
done < <(
  python3 - "$flavor" "$PALETTE_JSON" <<'EOF'
import json, sys

flavor = sys.argv[1]
palette_path = sys.argv[2]

with open(palette_path) as f:
  palette = json.load(f)

colors = palette.get(flavor, palette["mocha"])["colors"]
for name, data in colors.items():
  print(f"{name}={data['hex']}")
EOF
)

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["base"]="default"
fi

RESET="#[fg=${THEME[text]},bg=${THEME[base]},nobold,noitalics,nounderscore,nodim]"
