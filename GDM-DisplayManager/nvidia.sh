#!/bin/bash

sudo pacman -S --noconfirm nvidia nvidia-utils nvidia-settings libva-mesa-driver libva-vdpau-driver libva-utils

sudo mkdir -p /etc/pacman.d/hooks

echo "[Trigger]
Operation=Install
Operation=Upgrade
Operation=Remove
Type=Package
Target=nvidia
# Change the linux part above and in the Exec line if a different kernel is used

[Action]
Description=Update Nvidia module in initcpio
Depends=mkinitcpio
When=PostTransaction
Exec=/usr/bin/mkinitcpio -P" > /etc/pacman.d/hooks/nvidia.hook

echo "blacklist nouveau" > /etc/modprobe.d/blacklist-nvidia-nouveau.conf

echo 'Section "OutputClass"
Identifier "intel"
MatchDriver "i915"
Driver "modesetting"
EndSection

Section "OutputClass"
Identifier "nvidia"
MatchDriver "nvidia-drm"
Driver "nvidia"
Option "AllowEmptyInitialConfiguration"
Option "PrimaryGPU" "yes"
ModulePath "/usr/lib/nvidia/xorg"
ModulePath "/usr/lib/xorg/modules"
EndSection' > /etc/X11/xorg.conf.d/10-nvidia-drm-outputclass.conf


 cp -r mkinitcpio.conf /etc/
 

echo "xrandr --setprovideroutputsource modesetting NVIDIA-0
xrandr --auto" > $HOME/.xinitrc

echo '
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer' > /usr/share/gdm/greeter/autostart/optimus.desktop

echo '
[Desktop Entry]
Type=Application
Name=Optimus
Exec=sh -c "xrandr --setprovideroutputsource modesetting NVIDIA-0; xrandr --auto"
NoDisplay=true
X-GNOME-Autostart-Phase=DisplayServer' > /etc/xdg/autostart/optimus.desktop


echo "--enable-features=VaapiVideoDecoder,VaapiVideoEncoder
--enable-zero-copy
--disable-features=UseChromeOSDirectVideoDecoder" > $HOME/.config/chrome-flags.conf

sudo mkinitcpio -P
