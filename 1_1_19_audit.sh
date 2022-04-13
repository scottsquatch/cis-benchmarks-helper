#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.19: Ensure nosuid option set on removable media partitions
source common.sh
echo "Please manually verify that the nosuid option is set on all removable media partitions"
echo "run mount to see all mounted partitions"
exit $EXIT_CODE_MANUAL
