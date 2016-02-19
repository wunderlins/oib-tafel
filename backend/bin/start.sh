#!/usr/bin/env bash

# path settings for oracle client
export PATH=$PATH:/opt/instantclient_12_1
export ORACLE_HOME=/opt/instantclient_12_1
export LD_LIBRARY_PATH=$ORACLE_HOME
echo $PATH

export basedir=`dirname ${BASH_SOURCE[0]}`"/.."
export PATH=$PATH:$basedir/bin
basedir=`realpath $basedir`
cd "$basedir"

. $basedir/etc/config.py

echo "Starting server at port: $port"
#nohup ./myprogram.sh > /dev/null 2>&1 & echo $! > run.pid
nohup $basedir/httpd.py > $basedir/$web_logfile 2>&1 & echo $! > $basedir/$session_dir/$meta_name.pid
#nohup ./httpd.py > $web_logfile &
