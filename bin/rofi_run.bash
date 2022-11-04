#!/usr/bin/env bash

set -x
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

source "${SCRIPT_DIR}/unique_workspace.bash"

if [ -n "$*" ]
then
    new_program="$1"
    case "$ROFI_RETV" in
        1)
	    new_workspace=$(unique_workspace "$new_program")
	    i3-msg workspace "$new_workspace"\; exec "$new_program" > /dev/null 2>&1
            ;;
        *)
            coproc ( "$new_program"  > /dev/null  2>&1 )
            ;;
    esac
    exit 0
fi


echo -en "\0use-hot-keys\x1ftrue\n"
compgen -c |sort |uniq| sed -Ee 's/^(.*)$/\1\x00icon\x1f\1/'
