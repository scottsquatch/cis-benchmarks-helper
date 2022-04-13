#!/bin/bash
# Script to fix CIS Benchmark 1.1.2: Ensure /tmp is configured

# Currently uses systemd, to use fstab uncomment below
# echo "tmpfs   /tmp    tmpfs   defaults,rw,nosuid,nodev,noexec,relatime    0 0" | sudo tee -a /etc/fstab
sudo systemctl unmask tmp.mount
sudo systemctl enable tmp.mount
sudo mkdir -p /etc/systemd/system/local-fs.target.wants
cat << EOF | sudo tee /etc/systemd/system/local-fs.target.wants/tmp.mount
[Mount]
What=tmpfs
Where=/tmp
Type=tmpfs
Options=mode=1777,strictatime,noexec,nodev,nosuid
EOF
sudo systemctl daemon-reload
sudo systemctl restart tmp.mount
