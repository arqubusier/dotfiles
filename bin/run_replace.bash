#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "missing run command" >&2
    exit 1
fi
run_cmd="$1"
i3-msg move container to workspace pool
coproc ( "$run_cmd"  > /dev/null  2>1 )
