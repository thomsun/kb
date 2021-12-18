# Formatting disk using CLI

## Context
I have a new external harddrive that I want to use with my Ubuntu server. The server doesn't have GUI easily accessible so I want to format the drive via command line. Note that the command here is based on Ubuntu 20.04 that I have at the moment

## Instruction

### Checking partition

First, we need to check the drive/partition that the server is referring to the newly installed disk
``` bash
lsblk
```

or use -f option to also display the file system
``` bash
lsblk -f
``` 

This will show something like this
```
NAME           MAJ:MIN RM   SIZE RO TYPE MOUNTPOINT
loop0            7:0    0  42.2M  1 loop /snap/snapd/14066
loop1            7:1    0  61.9M  1 loop /snap/core20/1242
loop2            7:2    0    73M  1 loop /snap/lxd/22147
loop3            7:3    0  73.1M  1 loop /snap/lxd/22114
loop4            7:4    0  55.5M  1 loop /snap/core18/2246
loop6            7:6    0  43.3M  1 loop /snap/snapd/14295
loop7            7:7    0  55.5M  1 loop /snap/core18/2253
loop8            7:8    0  61.9M  1 loop /snap/core20/1270
sda              8:0    0   477G  0 disk
├─sda1           8:1    0   512M  0 part /boot/efi
└─sda2           8:2    0 476.4G  0 part /
sdc              8:32   0   1.8T  0 disk
├─sdc1           8:33   0   1.6T  0 part /mnt/ABC
├─sdc2           8:34   0     1K  0 part
├─sdc5           8:37   0   100G  0 part
│ └─veracrypt1 253:0    0   100G  0 dm   /mnt/DEF
└─sdc6           8:38   0   100G  0 part
  └─veracrypt2 253:1    0   100G  0 dm   /mnt/GHI
sdd              8:48   0   1.8T  0 disk
├─sdd1           8:49   0   200M  0 part
└─sdd2           8:50   0   1.8T  0 part
  └─veracrypt3 253:2    0   1.8T  0 dm   /mnt/JKL
sde              8:64   0   3.7T  0 disk
├─sde1           8:65   0   128G  0 part /mnt/MNO
└─sde2           8:66   0   3.5T  0 part
  └─veracrypt4 253:3    0   3.5T  0 dm   /mnt/PQR
sdf              8:80   0  10.9T  0 disk
└─sdf1           8:81   0  10.9T  0 part /mnt/STU
sr0             11:0    1  1024M  0 rom
```

Run this before and after connecting the drive so you will know which one is the disk you added. Get the drive name i.e. sdb (typically if it's the second drive of the server)

### Formatting the disk
My drive was preformatted with NTFS. Even though it works with Ubuntu, I want the drive to perform best in the environment and I don't plan to connect this drive to Windows machine. I plan to address compatibity by sharing this drive via Samba instead.

* In this case `/dev/sdg1` is my partition

To format to ext4
``` bash
sudo mkfs -t ext4 /dev/sdg1
``` 

To format to fat32
``` bash
sudo mkfs -t vfat /dev/sdg1
``` 

To format to fat32
``` bash
sudo mkfs -t ntfs /dev/sdg1
``` 

It will take a while. After it's done, check the file system again with
``` bash
lsblk -f
```
Make sure it shows the file system you just chose and get the UUID
``` 
sdg
└─sdg1         ext4                <uuid>
```

### Mount the disk

1. Create mount point
``` bash
sudo mkdir -p <mountpoint>
```
1. Update `/etc/fstab` to mount the disk automatically
``` bash
sudo vi /etc/fstab
```
Add a row like this. The config I use is for ext4 file system. For mounting ntfs or others, refer to `fstab` 
``` 
UUID=<uuid>      <mountpoint>      ext4    defaults,noatime                                0       0
```
1. Verify the mounting
`fstab` will work after reboot so to mount the drive immediately after updating `fstab` run the following
``` bash
# to mount the specific mountpoint
sudo mount <mountpoint> 
# or, to mount all the mountpoints defined in fstab
sudo mount -a 
```

## Reference
[https://phoenixnap.com/kb/linux-format-disk](https://phoenixnap.com/kb/linux-format-disk)