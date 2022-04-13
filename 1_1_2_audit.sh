#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.2: Ensure /tmp is configured
source common.sh

result=$EXIT_CODE_SUCCESS
cmd="mount | grep -E '\s/tmp\'s"
grep_result=`eval $cmd | xargs`
if [ -z "$grep_result" ]
then
    echo "$cmd returned '$grep_result', /tmp is not mounted"
    result=$EXIT_CODE_FAILURE
else
    echo "$cmd returned '$grep_result', showing that /tmp is mounted"
fi

cmd="grep -E '\s/tmp\s' /etc/fstab | grep -E -v '^\s*#'"
grep_result=`eval $cmd | xargs`
sysctl_enabled_cmd="systemctl is-enabled tmp.mount"
sysctl_enabled_result=`eval $sysctl_enabled_cmd | xargs`
echo "$cmd returned '$grep_result'"
echo "$sysctl_enabled_cmd returned '$sysctl_enabled_result'"
if [ -z "$grep_result" ] && [ "$sysctl_enabled_result" != "enabled" ]
then
    echo "$cmd returned no reults and $sysctl_enabled_cmd returned '$sysctl_enabled_result', suggesting tmpfs is not enabled"
    result=$EXIT_CODE_FAILURE
fi
exit $result
