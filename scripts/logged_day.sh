#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

get_cache "tmux-toggl-logged-day" 300 "$TOGGL sum -t" | tail -1 | grep -Po "\d+:\d+"
