# NVIDIA Optimus [Use NVIDIA graphics only] [GDM] [LightDM] [SDDM] + hardware acceleration for chrome/edge
The proprietary NVIDIA driver can be configured to be the primary rendering provider. 
based on https://wiki.archlinux.org/title/NVIDIA_Optimus#Use_NVIDIA_graphics_only

## Install

- git clone or manual download https://github.com/JonathanSanfilippo/nvidia-scripts-Archlinux.git
- cd nvidia-scripts-Archlinux
- [choose your Display Manager] cd GDM-DisplayManger
- chmod +x *
- ./nvidia.sh
- reboot

## hardware acceleration for edge 
- add flags in usr/share/applications/edge.desktop --enable-features=VaapiVideoDecoder,VaapiVideoEncoder 

