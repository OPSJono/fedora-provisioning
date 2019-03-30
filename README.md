# fedora-provisioning
Repo for holding the Ansible scripts used to provision my local machine.

Usage
=====
```
sudo chmod +x fedora-bootstrap.sh
./fedora-bootstrap.sh
cd playbooks
time ansible-playbook provision.yml
```  

#### Gnome Terminal Atom One Dark Theme

Go to gnome-terminal preferences and rename the unnamed profile to anything else.
```
./atom-one-dark.sh
```

### Mounting a shared folder
```
sudo vim /etc/fstab
//innovedxen/shared /mnt/shared cifs rw,relatime,vers=default,cache=strict,username=guest,domain=,uid=0,noforceuid,gid=0,noforcegid,addr=172.16.0.250,file_mode=0755,dir_mode=0755,soft,nounix,serverino,mapposix,rsize=1048576,wsize=1048576,echo_interval=60,actimeo=1 0 0
```


VFIO GPU Passthrough
====================

Fedora Must be installed from an install medium that boots in UEFI mode.  
(Black screen when selecting the "Start Fedora" not blue)


###### All commands should be ran as root
```
sudo -i
```

Step 1. Commands to edit the Grub bootloader to turn on IOMMU and load the VFIO-PCI driver early enough to grab your card:  
Edit this file: 
```
vim /etc/default/grub
```
 so that it looks like this:  
```
GRUB_TIMEOUT=5
GRUB_DISTRIBUTOR="$(sed 's, release .*$,,g' /etc/system-release)"
GRUB_DEFAULT=saved
GRUB_DISABLE_SUBMENU=true
GRUB_TERMINAL_OUTPUT="console"
GRUB_CMDLINE_LINUX="rd.lvm.lv=fedora/root rd.lvm.lv=fedora/swap iommu=1 intel_iommu=on amd_iommu=on rd.driver.pre=vfio-pci"
GRUB_DISABLE_RECOVERY="true"
```  

Step 2. Now you want to take note of the vendor & device ID pairs for the graphics card you are passing through to the virtual machine:  
`lspci -nn`  

Then look for your graphics card and it's sound device and write down the two sets of codes e.g. `[10de:13c0]` for each of those two devices.

Add this to configure the graphics card and its associated audio device - change the two pairs of codes to those of your graphics card and attached sound device - then save:
First create/open the file to edit:  
```
vim /etc/modprobe.d/vfio.conf
```
Then add the following line:
```
options vfio-pci ids=10de:13c0,10de:0fbb
```

Step 3. Now you want to edit the linux initial ramdisk to add the VFIO drivers with the following commands:
```
vim /etc/dracut.conf.d/vfio.conf
```

Then add the following line:
```
add_drivers+="vfio vfio_iommu_type1 vfio_pci"
```

Step 4. Edit kvm.conf:

```
vim /etc/modprobe.d/kvm.conf
```

There should be a hash (#) sign at the start of both lines to comment them out as these technologies are a bit unstable at the moment:
```
#options kvm_intel nested=1
#options kvm_amd nested=1
```

Step 5. Create a file in modprobe.d called blacklist.conf in order to blacklist the nouveau driver that will automatically grab your passthrough graphics card and your host graphics card if they're Nvidia, in turn preventing the vfio-pci driver from binding to your passthrough gpu:
```
vim /etc/modprobe.d/blacklist.conf
```

Add this to the file and save:

```
blacklist nouveau
blacklist lbm-nouveau
options nouveau modeset=0
alias nouveau off
alias lbm-nouveau off
```

Step 6. Update the initial ramdisk so vfio-pci driver loads up early:

```
sudo dracut -f --kver `uname -r`
```

Step 7. Update the grub bootloader:

```
sudo grub2-mkconfig > /etc/grub2-efi.cfg
```

#####Once you've executed everything without errors, reboot your system.

Step 8. Verify that vfio-pci has bound to your passthrough graphics card. You should see that the current driver for your graphics card says vfio-pci:

```
lspci -nnk
```

Example output:
```
02:00.0 VGA compatible controller [0300]: NVIDIA Corporation GM204 [GeForce GTX 980] [10de:13c0] (rev a1)
	Subsystem: eVga.com. Corp. Device [3842:2983]
	Kernel driver in use: vfio-pci
	Kernel modules: nouveau
02:00.1 Audio device [0403]: NVIDIA Corporation GM204 High Definition Audio Controller [10de:0fbb] (rev a1)
	Subsystem: eVga.com. Corp. Device [3842:2983]
	Kernel driver in use: vfio-pci
	Kernel modules: snd_hda_intel
```
