#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.23: Disable USB Storage
source common.sh

result=$EXIT_CODE_SUCCESS
cmd='modprobe -n -v usb-storage'
modprobe_result=`eval $cmd | xargs`
if [ "$modprobe_result" != "install /bin/true" ]
then
    echo "$cmd returned '$modprobe_result', expected 'install /bin/true'"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned 'install /bin/true' as expected"
fi

cmd='lsmod | grep usb-storage'
lsmod_result=`eval $cmd`
if [ -n "$lsmod_result" ]
then
    echo "$cmd returned '$lsmod_result', expected no output"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned no output as expected"
fi
exit $result
