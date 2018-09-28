#!/bin/bash

function tips() {
	echo -e "\033[40;37m\033[1m$* \033[0m"
}

function usage() {
	tips "usage:pcp files... path" 
}

if [ $# -le 1 ]; then
	usage
fi


rpath=${!#}
host=user@180.0.0.1
if ! ssh ${host} test -d ${rpath}; then
	tips "path(${rpath}) not exist" 
	usage
	exit 1 
fi

for((i=1;i<$#;i++)); do
	j=${!i}
	args="${args} $j"
done

scp ${args} ${host}:${rpath}
exit 0
