## Installing Broadcom WiFi drivers

### Source:  
https://www.tekbyte.net/install-broadcom-wifi-drivers-for-fedora-27/


```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

```
sudo dnf install -y "kernel-devel-uname-r == $(uname -r)"
```

```
sudo dnf install -y akmods
```

```
sudo dnf install -y broadcom-wl
```

### Reboot
