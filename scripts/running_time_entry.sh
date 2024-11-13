#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

tmux run-shell -b "tmux display-message \"\$(eval \"$TOGGL now | head -1\")\""

