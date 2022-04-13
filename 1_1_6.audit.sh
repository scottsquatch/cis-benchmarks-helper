#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.6: Ensure separate partition exists for /var
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep -E '\s/var\s'"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "$cmd returned nothing, suggesting /var is not mounted on a separate partition"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned '$result', suggesting /var is mounted on a separate partition, please fix manually"
fi
exit $result
