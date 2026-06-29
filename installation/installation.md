## 0. Network & disk

Connect to Wifi

```sh
iwctl station wlan0 scan
iwctl station wlan0 connect 'SSID'
```

Format disk

```sh
nvme format -s 1 -n 1 /dev/nvme0
```

Partition disk

```sh
fdisk /dev/nvme0n1
# - create GPT table by pressing "g"
# - create EFI partition: /dev/nvme0n1p1
# - change EFI partition type to uefi
# - create ROOT partition: /dev/nvme0n1p2
```

---

## 1. LUKS setup

Encrypt the LUKS partition

```sh
cryptsetup luksFormat /dev/nvme0n1p2
```

Open it as root and allow discards

```sh
cryptsetup --allow-discards --persistent open /dev/nvme0n1p2 root
```

Check

```sh
cryptsetup luksDump /dev/nvme0n1p2
```

---

## 2. Filesystems & mount

Create filesystems

```sh
mkfs.fat -F 32 /dev/nvme0n1p1
mkfs.ext4 /dev/mapper/root
```

Mount root and EFI

```sh
mount --mkdir /dev/mapper/root /mnt
mount --mkdir /dev/nvme0n1p1 /mnt/efi
```

Check layout just in case

```sh
lsblk
```

---

## 3. Base system install

Basic installation

```sh
pacstrap -K /mnt \
  base base-devel plymouth \
  linux linux-firmware sof-firmware intel-ucode \
  networkmanager iwd dnscrypt-proxy wireless-regdb \
  neovim zram-generator yazi
```

Generate fstab

```sh
genfstab -U /mnt >> /mnt/etc/fstab
```

---

## 4. Chroot & basic config

Chroot into configuration

```sh
arch-chroot /mnt
```

Restrict access to the ESP

```sh
# /etc/fstab
0022 => 0077 for permissions
```

Time configs

```sh
ln -sf /usr/share/zoneinfo/Asia/Yerevan /etc/localtime
hwclock --systohc
```

Edit /etc/locale.gen and uncomment needed locales

```sh
locale-gen
```

Set hostname

```sh
echo archlinux > /etc/hostname
```

Set wireless-regdb

```sh
# /etc/conf.d/wireless-regdom
WIRELESS_REGDOM="AM"
```

---

## 5. Root and User

Set root password

```sh
passwd
```

Create user and add it to wheel group

```sh
useradd -m -G wheel USERNAME
passwd USERNAME
```

Enable sudo for wheel

```sh
EDITOR=nvim visudo /etc/sudoers.d/10-wheel
# - and add
%wheel ALL=(ALL:ALL) ALL
```

---

## 6. mkinitcpio and UKI

Create kernel parameters folder

```sh
mkdir -p /etc/conf.d/
```

Copy UUID of the LUKS partition (/dev/nvme0n1p2)

```sh
blkid -s UUID -o value /dev/nvme0n1p2 > /etc/cmdline.d/root.conf
```

Add kernel parameters for UKI

```sh
# /etc/cmdline.d/root.conf
rd.luks.name=device-UUID=root root=/dev/mapper/root \
    rw quiet splash sysrq_always_enabled=1
```

Enable UKI generation in mkinitcpio and uncomment image generation

```sh
# /etc/mkinitcpio.d/linux.preset
default_uki="/efi/EFI/BOOT/BOOTX64.EFI"
```

Add hooks to mkinitcpio, before filesystems

```sh
# /etc/mkinitcpio.conf
"plymouth sd-encrypt"
```

Recreate mkinitcpio

```sh
mkinitcpio -P
```

---

## 7. Finish

```sh
exit
umount -R /mnt
cryptsetup close root
reboot
```
