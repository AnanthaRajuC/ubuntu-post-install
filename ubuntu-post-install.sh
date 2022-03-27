#!/bin/bash

##################################################################################################
# Authors:                                                                                       #
#   Anantha Raju C <arcswdev@gmail.com>                                                          #
#   Various Open Source Projects                                                                 #
#                                                                                                #
# Description:                                                                                   #
#  A post-installation bash script for Ubuntu                                                    #
#                                                                                                #
# Legal Preamble:                                                                                #
#                                                                                                #
# This script is free software; you can redistribute it and/or modify it under                   #
# the terms of the GNU General Public License as published by the Free Software                  #
# Foundation; version 3.                                                                         #
#                                                                                                #
# This script is distributed in the hope that it will be useful, but WITHOUT                     #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS                  #
# FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more                         #
# details.                                                                                       #
##################################################################################################

# Log Location on system.
LOG_LOCATION=~/Downloads
exec > >(tee -i $LOG_LOCATION/post-install-script.log)
exec 2>&1

c='\e[32m' # Coloured echo (Green)
y=$'\033[38;5;11m' # Coloured echo (yellow)
r='tput sgr0' #Reset colour after echo

#Display Banner
if [[ ! -z $(which figlet) ]]; then
    figlet AutoSetup
    echo -e "${y} - By Anantha Raju C"
else 
echo -e "\n\n\n\n
 _     _ _                              ______                   _____                      _ _ 
| |   | | |                _           (_____ \          _      (_____)           _        | | |
| |   | | | _  _   _ ____ | |_ _   _    _____) )__   ___| |_       _   ____   ___| |_  ____| | |
| |   | | || \| | | |  _ \|  _) | | |  |  ____/ _ \ /___)  _)     | | |  _ \ /___)  _)/ _  | | |
| |___| | |_) ) |_| | | | | |_| |_| |  | |   | |_| |___ | |__    _| |_| | | |___ | |_( ( | | | |
 \______|____/ \____|_| |_|\___)____|  |_|    \___/(___/ \___)  (_____)_| |_(___/ \___)_||_|_|_|                                                                                                                                                                                        
						                                       - By Anantha Raju C\n\n\n"
fi

# 5 seconds wait time to start the setup
for i in `seq 5 -1 1` ; do echo -ne "$i\rThe setup will start in..." ; sleep 1 ; done

echo -e "${c}Log Location should be: [ $LOG_LOCATION ]"

cd ~

echo -e "${c}\nRemoving unwanted packages."; $r
sudo apt autoremove -y


echo -e "${c}htop - An interactive process viewer."; $r
sudo snap install htop


echo -e "${c}bpytop - Linux/OSX/FreeBSD resource monitor."; $r
sudo snap install bpytop


echo -e "${c}cpufetch - Simple yet fancy CPU architecture fetching tool."; $r
sudo snap install cpufetch


echo -e "${c}neofetch - A command-line system information tool written in bash 3.2+"; $r
sudo apt install neofetch -y


echo -e "${c}bat - A cat(1) clone with syntax highlighting and Git integration."; $r
sudo apt install bat -y

echo -e "${c}Adding batcat alias."; $r
if ! grep -q "alias cat='batcat'" ".bashrc"; then echo "alias cat='batcat'" >> ~/.bashrc; fi


echo -e "${c}speedtest-cli - Command line interface for testing internet bandwidth using speedtest.net"; $r
sudo apt install speedtest-cli -y


echo -e "${c}terminator - multiple GNOME terminals in one window."; $r
sudo apt install terminator -y

echo -e "${c}tmux - terminal multiplexer"; $r
sudo apt install tmux -y


echo -e "${c}gdu - Fast disk usage analyzer with console interface written in Go."; $r
sudo add-apt-repository ppa:daniel-milde/gdu -y
sudo apt-get update
sudo apt-get install gdu -y


echo -e "${c}wget - GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols."; $r
sudo apt-get install wget -y


echo -e "${c}google chrome - Cross-platform web browser developed by Google."; $r
cd /home/anantha/Downloads
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install google-chrome-stable_current_amd64.deb
rm -f google-chrome-stable_current_amd64.deb
cd ~

# Various utilities

echo -e "${c}vlc - media player."; $r
sudo apt install vlc -y

# Final Upgrade and Update Command

echo -e "${c}Updating and upgrading to finish post-install script."; $r
sudo apt update
sudo apt upgrade -y
echo -e "${c}Fixing broken installation."; $r
sudo apt --fix-broken install -y

# Installation complete.

echo -e "${c}All done! Please reboot the computer."

# END OF SCRIPT
