#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

CACHE_SECONDS=$(get_tmux_option "@tmux-toggl-cache-seconds" "600")

get_cache "tmux-toggl-logged-day" $CACHE_SECONDS "$TOGGL sum -t" | tail -1 | grep -Po "\d+:\d+"
