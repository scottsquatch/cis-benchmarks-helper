#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.22: Disable Automounting
source common.sh
exit_code=$EXIT_CODE_SUCCESS

cmd="sudo systemctl is-enabled autofs"
result=`exec $cmd`
if [ "$result" != 'disabled' ] && [ -n "$result" ]
then
    echo "$cmd returned '$result'"
    exit_code=$EXIT_CODE_FAILURE
else
    echo "autofs is disabled, nothing to do"
fi

exit $exit_code
