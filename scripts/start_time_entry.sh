#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

project=$(eval "$TOGGL projects ls -f name" | tail -n +2 | sed 's/^[ \t]*//;s/[ \t]*$//' | fzf -m)

read -p 'Task: ' task

eval "$TOGGL start -o \"$project\" \"$task\""
