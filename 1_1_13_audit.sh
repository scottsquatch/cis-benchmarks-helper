#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.13: Ensure separate partition exists for /home
source common.sh

exit_code=$EXIT_CODE_SUCCESS
cmd="mount | grep /home"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "$cmd returned nothing, suggesting /home is not mounted on a separate partition, please fix manually"
    exit_code=$EXIT_CODE_MANUAL
else
    echo "$cmd returned '$result', suggesting /home is mounted on a separate partition"
fi

exit $exit_code
