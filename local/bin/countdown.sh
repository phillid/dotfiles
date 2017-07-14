#!/bin/bash

target=1600000000
delta=1

while [ $delta != 0 ] ; do
	unix=$(date +%s)
	delta=$(( $target - $unix ))
	echo $(date --date="@$unix") : $unix : $delta
	sleep 1
done
