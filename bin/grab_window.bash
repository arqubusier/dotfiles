#!/usr/bin/env bash
set -x
selected_window="$ROFI_INFO"
if [ -n "$*" ]
then
    case "$ROFI_RETV" in
        1)
            wmctrl -i -a "$selected_window"
            ;;
        10)
            wmctrl -i -R "$selected_window"
            ;;
        11)
            wmctrl -i -c "$selected_window"
            ;;
    esac
    exit 0
fi


echo -en "\0use-hot-keys\x1ftrue\n"
wmctrl -lx | sed -Ee 's/^([xa-f0-9]+) +([0-9]+) +[^\.]+\.([^ ]+)( +)[^ ]+ +(.+$)/\2 \3 \5 \x00icon\x1f\3\x1finfo\x1f\1\n/'
