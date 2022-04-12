#!/bin/bash
# Audit script to fix CIS Benchmark 1.1.1.3: Ensure mounting of squashfs filesystems is disabled

echo "install squashfs /bin/true" | sudo tee -a /etc/modprobe.d/cis-benchmarks.conf
