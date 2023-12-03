#!/usr/bin/env bash

DOW=$(($(date +%u)-1))
START_OF_WEEK=$(date --date="${dataset_date} -${DOW} day" +%Y-%m-%d)

toggl sum -st -s "$START_OF_WEEK" | head -2 | tail -1 | grep -Po "\d+:\d+"
