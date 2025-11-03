#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

get_cache "tmux-toggl-logged-month" 300 "$TOGGL sum -st -s \"$(date +%Y-%m-01)\" -p \"$(date +%Y-%m-01 --date="$(date +%Y-%m-15) next month")\"" | head -2 | tail -1 | grep -Po "\d+:\d+"
