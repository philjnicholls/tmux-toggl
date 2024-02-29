#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

DAILY_HOURS=$(get_tmux_option "@tmux-toggl-daily-hours" "7")
WEEKDAYS=$(get_tmux_option "@tmux-toggl-weekdays" "01234")

logged_hours=$($CURRENT_DIR/logged_month.sh)
time_arr=(${logged_hours//:/ })
# TODO We just throw away the minutes, we should use these to be more accurate
hours=${time_arr[0]}

function get_remaining {
    python3 <(echo '
import datetime
import sys

weekdays = {int(d) for d in sys.argv[1]}

start = datetime.date.today() + datetime.timedelta(days=1)
if start.month != datetime.date.today().month:
    print(0)
else:
    next_month = start.replace(day=28) + datetime.timedelta(days=4)
    end = next_month - datetime.timedelta(days=next_month.day)
    days = len([date for date in (start + datetime.timedelta(n) for n in range((end-start).days+1)) if date.weekday() in weekdays])
    print(int(days))
    ') "$WEEKDAYS"
}

days=$(get_remaining)

echo $((($days*$DAILY_HOURS)+$hours))
