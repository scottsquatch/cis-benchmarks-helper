#!/bin/bash
# Audit script to fix CIS Benchmark 1.1.1.2: Ensure mounting of vfat filesystems is limited

echo "install vfat /bin/true" | sudo tee -a /etc/modprobe.d/cis-benchmarks.conf
