#!/bin/sh
# Author Jonathan Sanfilippo


echo ""
echo "Install Nvidia driver on Archlinux"
echo ""

sudo pacman -S nvidia
sudo mkdir -p /etc/pacman.d/hooks
sudo cp -r nvidia.hook /etc/pacman.d/
sudo cp -r blacklist-nvidia-nouveau.conf /etc/modprobe.d/
sudo cp -r 20-nvidia.conf /etc/X11/xorg.conf.d/
sudo cp -r mkinitcpio.conf /etc
sudo mkinitcpio -P linux
cp -r .xinitrc ~/


echo ""
echo ""
echo Nvidia drivers installed - Press enter to exit; 
echo ""
read



