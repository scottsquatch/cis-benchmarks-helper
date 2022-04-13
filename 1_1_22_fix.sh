#!/bin/bash
# Script to fix CIS Benchmark 1.1.22: Disable Automounting

sudo systemctl --now disable autofs
