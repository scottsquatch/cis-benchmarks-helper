#!/bin/bash
# Audit script to fix CIS Benchmark 1.1.1.4: Ensure mounting of udf filesystems is disabled

echo "install udf /bin/true" | sudo tee -a /etc/modprobe.d/cis-benchmarks.conf
rmmod udf
