#!/bin/sh
# Author Jonathan Sanfilippo


echo ""
echo "Install Nvidia driver and gpu chrome accelleration on Archlinux"
echo ""

sudo pacman -S nvidia libva-mesa-driver nvidia-settings libva-vdpau-driver libva-utils

sudo mkdir -p /etc/pacman.d/hooks
sudo cp -r nvidia.hook /etc/pacman.d/
sudo cp -r blacklist-nvidia-nouveau.conf /etc/modprobe.d/
sudo cp -r 20-nvidia.conf /etc/X11/xorg.conf.d/
sudo cp -r mkinitcpio.conf /etc

sudo mkinitcpio -P linux

echo "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder
--enable-zero-copy
--disable-features=UseChromeOSDirectVideoDecoder" > ~/.config/chrome-flags.conf




echo ""
echo ""
echo Nvidia drivers installed - Press enter to exit; 
echo ""
read




