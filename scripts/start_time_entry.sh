#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

EXTRA_ENTRIES_OPTION=$(get_tmux_option "@tmux-toggl-extra-time-entries" "")
IFS=',' read -r -a EXTRA_ENTRIES <<< "$EXTRA_ENTRIES_OPTION"

project=$(eval "$TOGGL projects ls -f name" | tail -n +2 | sed 's/^[ \t]*//;s/[ \t]*$//' | fzf -m)

response=$(eval "$TOGGL ls -o \"$project\" -f description" | tail -n +2 | cat - <(printf "%s\n" "${EXTRA_ENTRIES[@]}") | sed 's/^[ \t]*//;s/[ \t]*$//' | awk '!x[$0]++' | fzf --print-query --expect alt-enter)
if [ -n "$response" ]; then
  readarray -t responses <<< "$response"
  query=${responses[0]}
  key=${responses[1]}
  selection=${responses[2]}

  if [ "$key" = "alt-enter" ]; then
    time_entry="$query"
  else
    time_entry="$selection"
  fi
  COMMAND=''"$TOGGL"' start -o "'"$project"'" "'"$time_entry"'" && "'"$CURRENT_DIR"'/running_time_entry.sh" &'
  nohup bash -c "$COMMAND" >/dev/null 2>&1
fi
