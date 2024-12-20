#!/usr/bin/env bash

get_tmux_option() {
  local option=$1
  local default_value=$2
  local option_value=$(tmux show-option -gqv "$option")
  if [ -z "$option_value" ]; then
    echo $default_value
  else
    echo $option_value
  fi
}

OPTIONS=$(get_tmux_option "@tmux-toggl-togglcli-options" "")
TOGGL_PATH=$(get_tmux_option "@tmux-toggl-togglcli-path" "toggl")
TOGGL="$TOGGL_PATH $OPTIONS"
