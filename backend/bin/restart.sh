#!/usr/bin/env bash

export basedir=`dirname ${BASH_SOURCE[0]}`"/.."
which realpath >/dev/null 2>&1
if [[ $? == 0 ]]; then
	basedir=`realpath $basedir`
else 
	basedir=`$basedir/bin/realpath $basedir`
fi

$basedir/bin/stop.sh
$basedir/bin/start.sh
