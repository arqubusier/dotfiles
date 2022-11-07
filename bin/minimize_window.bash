#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/unique_workspace.bash"

window=$(xdotool getactivewindow getwindowname 2>/dev/null || echo "None")
new_workspace=$(unique_workspace "$window")
i3-msg move window to workspace "${new_workspace}"
