# Change Log

## 0.1

* Configure bind keys
* Don't send keys if no time entry running
* Add a config for live issues, discussing tickets etc.
* Add a dialog to select Project
* Configurable projects

## 0.2

* Status bar display of current time log
* Status bar display of logged hours in day, week and month for a project
* Status bar display for projected hours for day, week and month (for a project?)
* Make hours in a day configurable

## 0.3

* Configurable options for toggl-cli

## 0.4

* FIX broken starting a recent time entry from 0.3

## 0.5

* Add support for weekly logged hours starting on Sunday
* FIX bad calculation of projected hours

## 0.6

* FEATURE stop currently running time log

## 0.7

* Start a new timer

## 0.8

* FIX Corrected calculation of remaining hours on last day of the month

## 0.9

* Added tmux-toggl-project option to have a fixed project

## 0.10

* Fix for required end date in sum requests

## 0.11

* Fix typo causing fixed project to fail

## 0.12

* Fix zero hour bug

## 0.13

* Add lock files to prevent simultaneous toggl commands

## 0.14

* Move lock files to /var/run

## 0.15

* Add timeout to toggl calls to prevent getting stuck when network changes

## 0.16

* Add option to configure path to togglCli

## 0.17

* nohup running task
