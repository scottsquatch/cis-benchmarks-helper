#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.21: Ensure sticky bit is set on all world-writable directories
source common.sh
exit_code=$EXIT_CODE_SUCCESS

result=`df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null`
if [ -n "$result" ]
then
    echo "The following directories are world-writable without sticky bit set, please review before running fix script"
    echo "$result"
    exit_code=$EXIT_CODE_FAILURE
else
    echo "No folders found, nothing to do"
fi

exit $exit_code
