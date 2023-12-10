#!/usr/bin/env bash
CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/scripts/helpers.sh"

KEY_RUNNING_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-running-time-entry-key" "T")
KEY_START_RECENT_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-start-recent-time-entry-key" "t")
KEY_SEND_KEYS_RUNNING_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-send-keys-running-time-entry-key" "l")
KEY_STOP_TIME_ENTRY=$(get_tmux_option "@tmux-toggl-stop-time-entry-key" "S")

tmux bind-key "$KEY_RUNNING_TIME_ENTRY" run-shell "$CURRENT_DIR/scripts/running_time_entry.sh"
tmux bind-key "$KEY_START_RECENT_TIME_ENTRY" display-popup -E "$CURRENT_DIR/scripts/start_recent_time_entry.sh"
tmux bind-key "$KEY_SEND_KEYS_RUNNING_TIME_ENTRY" run-shell "$CURRENT_DIR/scripts/send_keys_running_time_entry.sh"
tmux bind-key "$KEY_STOP_TIME_ENTRY" run-shell "$CURRENT_DIR/scripts/stop_time_entry.sh"

toggl_interpolation=(
  "\#{toggl-month-logged}"
  "\#{toggl-day-logged}"
  "\#{toggl-projected-hours}"
)
toggl_commands=(
  "#($CURRENT_DIR/scripts/logged_month.sh)"
  "#($CURRENT_DIR/scripts/logged_day.sh)"
  "#($CURRENT_DIR/scripts/projected_hours.sh)"
)

set_tmux_option() {
  local option=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

do_interpolation() {
  local all_interpolated="$1"
  for ((i = 0; i < ${#toggl_commands[@]}; i++)); do
    all_interpolated=${all_interpolated//${toggl_interpolation[$i]}/${toggl_commands[$i]}}
  done
  echo "$all_interpolated"
}

update_tmux_option() {
  local option
  local option_value
  local new_option_value
  option=$1
  option_value=$(get_tmux_option "$option")
  new_option_value=$(do_interpolation "$option_value")
  set_tmux_option "$option" "$new_option_value"
}

main() {
  update_tmux_option "status-right"
  update_tmux_option "status-left"
}
main
