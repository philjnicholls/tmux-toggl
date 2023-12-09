#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

DOW=$(($(date +%u)-1))
START_OF_WEEK=$(date --date="${dataset_date} -${DOW} day" +%Y-%m-%d)

eval "$TOGGL sum -st -s \"$START_OF_WEEK\"" | head -2 | tail -1 | grep -Po "\d+:\d+"
