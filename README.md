# NVIDIA Optimus [Use NVIDIA graphics only] [GDM] [LightDM] [SDDM] + hardware acceleration for chrome/edge
The proprietary NVIDIA driver can be configured to be the primary rendering provider. 
based on https://wiki.archlinux.org/title/NVIDIA_Optimus#Use_NVIDIA_graphics_only


![Screenshot from 2023-01-24 17-20-16](https://user-images.githubusercontent.com/103053714/214363172-0229b8fc-38a9-47aa-af99-f71f27f6ed6f.png)


## Install

- git clone or manual download https://github.com/JonathanSanfilippo/nvidia-scripts-Archlinux.git
- cd nvidia-scripts-Archlinux
- [choose your Display Manager] cd GDM-DisplayManger
- chmod +x *
- ./nvidia.sh
- reboot

## hardware acceleration for edge 
- add flags in usr/share/applications/edge.desktop --enable-features=VaapiVideoEncoder 

