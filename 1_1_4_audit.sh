#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.4: Ensure nosuid option set on /tmp partition
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep -E '\s/tmp\s' | grep -v nosuid"
result=`eval $cmd | xargs`
if [ -n "$result" ]
then
    echo "$cmd returned '$result', suggesting nosuid is not set on /tmp. Please fix manually"
    result=$EXIT_CODE_MANUAL
else
    echo "$cmd returned nothing, suggesting nosuid is set on /tmp"
fi
exit $result
