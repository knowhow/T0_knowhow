#!/bin/bash

function usage () {
	echo "$0 <URL> <OUT_NAME>"
	echo "example: $0 http://archive.ba/mini.iso natty_amd64_netboot.iso"
	exit 0
}


if [[ "$1" == "" ]]; then
	usage
fi

if [[ "$2" == "" ]]; then
	usage
fi 

URL=$1
OUT=$2

# "--continue -" znači da automatski nastavi download tamo gdje je stao
curl --append --continue - --output $OUT $URL