#!/usr/bin/env bash

toggl sum -t | tail -1 | grep -Po "\d+:\d+"
