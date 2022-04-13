#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.11: Ensure separate partition exists for /var/log
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep /var/log"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "$cmd returned nothing, suggesting /var/log is not mounted on a separate partition, please fix manually"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned '$result', suggesting /var/log is mounted on a separate partition"
fi
exit $result
