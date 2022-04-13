#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.15: Ensure nodev option set on /dev/shm
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep /dev/shm"
result=`eval $cmd | xargs`
if [ -z "$result" ]
then
    echo "It appears /dev/shm is not on separate partition, Benchmark does not apply"
    exit $EXIT_CODE_DOES_NOT_APPLY
fi
cmd="mount | grep -E '\s/dev/shm\s' | grep -v nodev"
result=`eval $cmd | xargs`
if [ -n "$result" ]
then
    echo "$cmd returned '$result', suggesting /dev/shm does not have nodev option set"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned nothing, suggesting /dev/shm has nodev set"
fi
exit $result
