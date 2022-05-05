#!/usr/bin/env bash

exec::date(){
	local type=$(
		echo "$@" | \
		sed 's;Dcr: ;'';g' | \
		base64 -d
	); # This variable serves to read an argument from the localtime function to be executed by the component below it

	# 	
	date +${type} &> /dev/null && {
		eval $(
			echo "date +${type}"
		);
	} || {
		e="invalid or unreadable option"; throw
		return 1
	}
}

# Useful functions to perform intrusions with users such as writing arguments that will be returned in base64 form
localtime::create(){
	local type_options="";
	local end="";

	if (test "$1" == "Type:"); then
		local type_options="$2"
	fi

	if (test "$3" == "then:"); then
		local end="$4"
	fi

	if [[ "$end" != End ]]; then
#		echo "Error: Line (${BASH_LINENO[1]}|${BASH_SOURCE[0]})"
#		echo "Error: Penutup tidak di temukan atau tidak di tulis"
		e="cover is not found or not written"; throw
		return 123
	fi

	if [[ -z "$type_options" ]]; then
		dummy=
	else
		kembalikan=$(echo "$type_options"|base64)
	fi; echo "Dcr: $kembalikan"
}

shopt -s expand_aliases

alias localtime:="localtime::create"
alias Date::Time?="exec::date"
