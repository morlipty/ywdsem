## 0. Network & disk

Connect to Wifi

```sh
iwctl device list
iwctl station 'NAME' scan     # e.g. wlan0
iwctl station 'NAME' connect 'SSID'
```

Partition disk

```sh
fdisk -l
fdisk /dev/DEVICE        # e.g. /dev/nvme0n1
#  - create EFI partition: /dev/DEVICEp1
#  - create BOOT partition: /dev/DEVICEp2
#  - create ROOT partition: /dev/DEVICEp3
```

---

## 1. LUKS setup

```sh
# Encrypt the LUKS partition
cryptsetup luksFormat /dev/DEVICEp3

# Open it as /dev/mapper/root and allow discards
cryptsetup --allow-discards --persistent open /dev/DEVICEp3 root

# Check
cryptsetup luksDump /dev/DEVICEp3 | grep Flags
```

---

## 2. Filesystems & mount

```sh
# Filesystems
mkfs.fat -F 32 /dev/DEVICEp1       # EFI partition
mkfs.ext4 /dev/DEVICEp2
mkfs.ext4 /dev/mapper/root

# Mount root
mount --mkdir /dev/mapper/root /mnt

# Mount EFI & boot
mount --mkdir /dev/DEVICEp1 /mnt/efi
mount --mkdir /dev/DEVICEp2 /mnt/boot

# Check layout just in case
lsblk
```

---

## 3. Base system install

```sh
pacstrap -K /mnt \
  base base-devel plymouth \
  linux linux-firmware sof-firmware intel-ucode \
  networkmanager iwd dnscrypt-proxy wireless-regdb \
  neovim zram-generator yazi

# Generate fstab
genfstab -U /mnt >> /mnt/etc/fstab
```

---

## 4. Chroot & basic config

```sh
arch-chroot /mnt

# Timezone
ln -sf /usr/share/zoneinfo/Asia/Yerevan /etc/localtime
hwclock --systohc

# (Before this: edit /etc/locale.gen and uncomment needed locales)
locale-gen

# Hostname
echo archlinux > /etc/hostname
```

---

## 5. Root and User

```sh
# Root password
passwd

# Create user (wheel = sudo group)
useradd -m -G wheel USERNAME
passwd USERNAME

# Enable sudo for wheel
EDITOR=nvim visudo /etc/sudoers.d/10-wheel
# and add
%wheel ALL=(ALL:ALL) ALL
```

---

## 6. mkinitcpio

```sh
# Add hooks to /etc/mkinitcpio.conf, before filesystems
"plymouth sd-encrypt"

# Recreate mkinitcpio
mkinitcpio -P
```

---

## 7. Bootloader

```sh
# Install GRUB for UEFI
pacman -S grub efibootmgr

grub-install \
  --efi-directory=/efi \
  --boot-directory=/boot \
  --removable
```

## 8. GRUB config

```sh
blkid
```

Copy UUID of the LUKS partition (/dev/DEVICEp2)

Add to /etc/default/grub in GRUB_CMDLINE_LINUX (single line)

```sh
rd.luks.name=device-UUID=root root=/dev/mapper/root
```

Also add to GRUB_CMDLINE_LINUX_DEFUALT

```sh
splash sysrq_always_enabled=1
```

And add

```sh
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
```

Generate grub config

```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

Exit & unmount

```sh
exit
umount -R /mnt
cryptsetup close root
reboot
```
