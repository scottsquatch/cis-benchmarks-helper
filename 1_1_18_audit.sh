#!/bin/bash
# Audit script to verify CIS Benchmark 1.1.18: Ensure nodev option set on removable media partitions
source common.sh
echo "Please manually verify that the nodev option is set on all removable media partitions"
echo "run mount to see all mounted partitions"
exit $EXIT_CODE_MANUAL
