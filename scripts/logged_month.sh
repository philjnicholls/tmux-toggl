#!/usr/bin/env bash

toggl sum -st -s "$(date +%Y-%m-01)" | head -2 | tail -1 | grep -Po "\d+:\d+"
