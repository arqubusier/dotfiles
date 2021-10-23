#!/usr/bin/env bash

selected_window="$ROFI_INFO"
if [ -n "$*" ]
then
    case "$ROFI_RETV" in
        1)
            new_workspace=$(wmctrl -l | sed -nEe "/${selected_window}/s/^[xa-f0-9]+ +([0-9]+).*/\1/p")
            xdotool getwindowfocus set_desktop_for_window "$new_workspace"
            wmctrl -i -R "$selected_window"
            ;;
        10)
            wmctrl -i -R "$selected_window"
            ;;
        *)
            wmctrl -a "$win"
            ;;
    esac
    exit 0
fi


echo -en "\0use-hot-keys\x1ftrue\n"
wmctrl -lx | sed -Ee 's/^([xa-f0-9]+) +([0-9]+) +[^\.]+\.([^ ]+)( +)[^ ]+ +(.+$)/\2 \3 \5 \x00icon\x1f\3\x1finfo\x1f\1\n/'
