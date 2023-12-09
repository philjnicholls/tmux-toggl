#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

EXTRA_ENTRIES_OPTION=$(get_tmux_option "@tmux-toggl-extra-time-entries" "")
IFS=',' read -r -a EXTRA_ENTRIES <<< "$EXTRA_ENTRIES_OPTION"

project=$(eval "$TOGGL projects ls -f name" | tail -n +2 | sed 's/^[ \t]*//;s/[ \t]*$//' | fzf -m)

time_entry=$(eval "$TOGGL ls -o \"$project\" -f description" | tail -n +2 | cat - <(printf "%s\n" "${EXTRA_ENTRIES[@]}") | sed 's/^[ \t]*//;s/[ \t]*$//' | awk '!x[$0]++' | fzf -m)

if [ -n "$time_entry" ]; then
	nohup bash -c '"$TOGGL" start -o "'"$project"'" "'"$time_entry"'" && "'"$CURRENT_DIR"'/running_time_entry.sh" &' >/dev/null 2>&1
fi
