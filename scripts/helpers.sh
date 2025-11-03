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

get_cache() {
  CACHE_KEY=$1
  UPDATE_INTERVAL=$2
  COMMAND=$3
  
  if [ -f "/tmp/$CACHE_KEY" ]; then
      LAST_UPDATE=$(stat -c %Y "/tmp/$CACHE_KEY")
      CURRENT_TIME=$(date +%s)
      if [ $((CURRENT_TIME - LAST_UPDATE)) -lt "$UPDATE_INTERVAL" ]; then
          cat "/tmp/$CACHE_KEY"
          exit
      fi
  fi
  NEW_VALUE=$($COMMAND)
  echo "$NEW_VALUE" > "/tmp/$CACHE_KEY"
  cat "/tmp/$CACHE_KEY"
}

OPTIONS=$(get_tmux_option "@tmux-toggl-togglcli-options" "")
TOGGL_PATH=$(get_tmux_option "@tmux-toggl-togglcli-path" "toggl")
TOGGL="$TOGGL_PATH $OPTIONS"
