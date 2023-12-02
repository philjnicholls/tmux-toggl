#!/usr/bin/env bash

tmux display-message "$(toggl now | head -1)"
