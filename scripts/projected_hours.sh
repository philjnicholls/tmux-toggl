#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

DAILY_HOURS=$(get_tmux_option "@tmux-toggl-daily-hours" "7")

logged_hours=$($CURRENT_DIR/logged_month.sh)
time_arr=(${logged_hours//:/ })
# TODO We just throw away the minutes, we should use these to be more accurate
hours=${time_arr[0]}

days=$(python3 -c "
import datetime

start = datetime.date.today()
next_month = start.replace(day=28) + datetime.timedelta(days=4)
end = next_month - datetime.timedelta(days=next_month.day)

daydiff = end.weekday() - start.weekday()

days = ((end-start).days - daydiff) / 7 * 5 + min(daydiff,5) - (max(end.weekday() - 4, 0) % 5)
print(int(days))")

echo $((($days*$DAILY_HOURS)+$hours))
