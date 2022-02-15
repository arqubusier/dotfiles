#!/bin/bash

kill -${1:-7} $(ps -ef | rofi -dmenu | awk "{ print $1 }")
