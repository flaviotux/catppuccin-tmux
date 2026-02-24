#!/usr/bin/env bash

# check if enabled
ENABLED=$(tmux show-option -gv @catppuccin_show_path 2>/dev/null)
[[ ${ENABLED} -ne 1 ]] && exit 0

# Imports
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
. "${ROOT_DIR}/lib/coreutils-compat.sh"

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/themes.sh"

PATH_FORMAT=$(tmux show-option -gv @catppuccin_path_format 2>/dev/null) # full | relative
RESET="#[fg=${THEME[text]},bg=${THEME[base]},nobold,noitalics,nounderscore,nodim]"

current_path="${1}"
default_path_format="relative"
PATH_FORMAT="${PATH_FORMAT:-$default_path_format}"

# check user requested format
if [[ ${PATH_FORMAT} == "relative" ]]; then
  current_path="$(echo ${current_path} | sed 's#'"$HOME"'#~#g')"
fi

echo "#[fg=${THEME[blue]},bg=default]░  ${RESET}#[bg=default]${current_path} "
