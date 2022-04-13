#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.7: Ensure separate partition exists for /var/tmp
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep /var/tmp"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "$cmd returned nothing, suggesting /var/tmp is not mounted on a separate partition, please fix manually"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned '$result', suggesting /var/tmp is mounted on a separate partition"
fi
exit $result
