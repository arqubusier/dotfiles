#!/usr/bin/env bash

unique_workspace () {
    new_program="$1"
    workspaces="$(i3-msg -t get_workspaces)"
    i=0
    while [[ $i -le 100 ]] ;do
	new_workspace="${new_program}${i}"
	res=$(echo "$workspaces" |jq "[.[].name] | map(select(. == \"$new_workspace\"))")
	if [[ $res = "[]" ]]; then
	    break;
	fi
	((i++))
    done

    echo $new_workspace
}
