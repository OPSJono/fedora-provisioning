#!/usr/bin/env bash
sudo dnf install -y grubby
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
echo "Done! Restart required..."