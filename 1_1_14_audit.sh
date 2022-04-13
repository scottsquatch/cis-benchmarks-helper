#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.14: Ensure nodev option set on /home
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep /home"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "It appears /home is not on separate partition, Benchmark does not apply"
    exit $EXIT_CODE_DOES_NOT_APPLY
fi
cmd="mount | grep -E '\s/home\s' | grep -v nodev"
result=`eval $cmd | xargs`
if [ -n "$result" ]
then
    echo "$cmd returned '$result', suggesting /home does not have nodev option set"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned nothing, suggesting /home has nodev set"
fi
exit $result
