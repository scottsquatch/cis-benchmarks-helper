#!/bin/bash
# Audit script to fix CIS Benchmark 1.1.23: Disable USB Storage

echo "install usb-storage /bin/true" | sudo tee -a /etc/modprobe.d/cis-benchmarks.conf
sudo rmmod usb-storage
