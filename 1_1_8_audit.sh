#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.8: Ensure nodev option set on /var/tmp
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep /var/tmp"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "It appears /var/tmp is not on separate partition, Benchmark does not apply"
    exit $EXIT_CODE_DOES_NOT_APPLY
fi
cmd="mount | grep -E '\s/var/tmp\s' | grep -v nodev"
result=`eval $cmd | xargs`
if [ -n "$result" ]
then
    echo "$cmd returned '$result', suggesting /var/tmp does not have nodev option set"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned nothing, suggesting /var/tmp has nodev set"
fi
exit $result
