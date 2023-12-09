#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

TIME_ENTRY="$(eval "$TOGGL now" | head -1 | sed -e 's/\s*#[[:digit:]]\+$//g')"

[[ ${TIME_ENTRY} != *"no time entry running"* ]] && tmux send-keys "$TIME_ENTRY" || exit 0
