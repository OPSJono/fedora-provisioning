#!/usr/bin/env bash
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf update -y
sudo dnf install -y git vim-enhanced xclip libselinux-python
sudo pip3 install ansible boto boto3 scss
sudo pip install boto boto3
sudo mkdir /etc/ansible/
sudo cp ansible_hosts /etc/ansible/hosts
