#!/usr/bin/env bash
sudo dnf update -y
sudo dnf install -y git vim xclip libselinux-python
sudo pip install ansible boto boto3
