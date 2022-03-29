#!/bin/bash
# Audit script to fix CIS Benchmark 1.1.1.1: Ensure mounting of cramfs filesystems is disabled

echo "install cramfs /bin/true" | sudo tee -a /etc/modprobe.d/cis-benchmarks.conf
