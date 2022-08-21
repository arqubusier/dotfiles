#!/usr/bin/env bash

if [ -n "$*" ]
then
    new_program="$1"
    case "$ROFI_RETV" in
        1)
            i3-msg move container to workspace pool > /dev/null 2>&1
            coproc ( "$new_program"  > /dev/null  2>&1 )
            ;;
        *)
            coproc ( "$new_program"  > /dev/null  2>&1 )
            ;;
    esac
    exit 0
fi


echo -en "\0use-hot-keys\x1ftrue\n"
compgen -c
