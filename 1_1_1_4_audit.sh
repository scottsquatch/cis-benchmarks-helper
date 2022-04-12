#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.1.4: Ensure mounting of udf filesystems is disabled
source common.sh

result=$EXIT_CODE_SUCCESS
cmd='modprobe -n -v udf'
modprobe_result=`eval $cmd | xargs`
if [ "$modprobe_result" != "install /bin/true" ]
then
    echo "$cmd returned '$modprobe_result', expected 'install /bin/true'"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned 'install /bin/true' as expected"
fi

cmd='lsmod | grep udf'
lsmod_result=`eval $cmd`
if [ -n "$lsmod_result" ]
then
    echo "$cmd returned '$lsmod_result', expected no output"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned no output as expected"
fi
exit $result
