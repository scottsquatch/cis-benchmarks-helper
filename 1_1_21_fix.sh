#!/bin/bash
# Audit script to fix CIS Benchmark 1.1.22: Ensure sticky bit is set on all world-writable directories
df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | \
     xargs -I '{}' chmod a+t '{}'
