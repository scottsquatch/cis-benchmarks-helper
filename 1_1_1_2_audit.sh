#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.1.2: Ensure mounting of vFAT filesystems is limited
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="grep -E -i '\svfat\s' /etc/fstab"
grep_result=`eval $cmd`
if [ -n "$grep_result" ]
then
    echo "$cmd returned '$grep_result', nothing to do"
    exit $EXIT_CODE_SUCCESS
fi
cmd='modprobe -n -v vfat'
modprobe_result=`eval $cmd | xargs`
if [ "$modprobe_result" != "install /bin/true" ]
then
    echo "$cmd returned '$modprobe_result', expected 'install /bin/true'"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned 'install /bin/true' as expected"
fi

cmd='lsmod | grep vfat'
lsmod_result=`eval $cmd`
if [ -n "$lsmod_result" ]
then
    echo "$cmd returned '$lsmod_result', expected no output"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned no output as expected"
fi
exit $result
