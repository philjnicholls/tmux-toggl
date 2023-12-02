#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

KEY_RUNNING_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-running-time-entry-key" "T")
KEY_START_RECENT_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-start-recent-time-entry-key" "t")
KEY_SEND_KEYS_RUNNING_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-send-keys-running-time-entry-key" "l")

tmux bind-key "$KEY_RUNNING_TIME_ENTRY" run-shell "$CURRENT_DIR/scripts/running_time_entry.sh"
tmux bind-key "$KEY_START_RECENT_TIME_ENTRY" display-popup -E "$CURRENT_DIR/scripts/start_recent_time_entry.sh"
tmux bind-key "$KEY_SEND_KEYS_RUNNING_TIME_ENTRY" run-shell "$CURRENT_DIR/scripts/send_keys_running_time_entry.sh"
