#!/usr/bin/env bash

TIME_ENTRY="$(toggl now | head -1 | sed -e 's/\s*#[[:digit:]]\+$//g')"

[[ ${TIME_ENTRY} != *"no time entry running"* ]] && tmux send-keys "$TIME_ENTRY" || exit 0
