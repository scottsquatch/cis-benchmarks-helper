#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.12: Ensure separate partition exists for /var/log/audit
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep /var/log/audit"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "$cmd returned nothing, suggesting /var/log/audit is not mounted on a separate partition, please fix manually"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned '$result', suggesting /var/log/audit is mounted on a separate partition"
fi
exit $result
