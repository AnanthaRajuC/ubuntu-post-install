#!/bin/bash
#
# Authors:
#   Anantha Raju C <arcswdev@gmail.com>
#
# Description:
#  A post-installation bash script for Ubuntu
#
# Legal Preamble:
#
# This script is free software; you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation; version 3.
#
# This script is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
# details.

cd ~

# An interactive process viewer.

sudo snap install htop -y

# Linux/OSX/FreeBSD resource monitor.

sudo snap install bpytop -y

# Simple yet fancy CPU architecture fetching tool.

sudo snap install cpufetch -y

# A command-line system information tool written in bash 3.2+

sudo apt install neofetch -y

# A cat(1) clone with syntax highlighting and Git integration.

sudo apt install bat -y

# Command line interface for testing internet bandwidth using speedtest.net

sudo apt install speedtest-cli -y

# multiple GNOME terminals in one window.

sudo apt install terminator -y

# Fast disk usage analyzer with console interface written in Go.

sudo add-apt-repository ppa:daniel-milde/gdu
sudo apt-get update
sudo apt-get install gdu -y

# GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols.

sudo apt-get install wget -y

# Cross-platform web browser developed by Google.

cd /home/anantha/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
cd ~

# Various utilities

sudo apt install vlc -y

# Installation complete.

echo "All done! Please reboot the computer."

# END OF SCRIPT
