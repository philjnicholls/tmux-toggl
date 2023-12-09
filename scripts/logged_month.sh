#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

eval "$TOGGL sum -st -s \"$(date +%Y-%m-01)\"" | head -2 | tail -1 | grep -Po "\d+:\d+"
