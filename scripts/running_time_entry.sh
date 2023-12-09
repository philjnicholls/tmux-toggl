#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

MESSAGE=$(eval "$TOGGL now | head -1")
tmux display-message "$MESSAGE"
