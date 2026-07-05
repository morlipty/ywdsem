## 0. Network configuration

Fallback to dnscrypt

```sh
# /etc/resolv.conf
nameserver 127.0.0.1
options edns0
```

And make resolv.conf immutable

```sh
sudo chattr +i /etc/resolv.conf
```

Make iwd as wifi backend

```sh
# /etc/NetworkManager/conf.d/wifi_backend.conf
[device]
wifi.backend=iwd
```

Add cloudflare to dnscrypt-proxy config

```sh
# /etc/dnscrypt-proxy/dnscrypt-proxy.toml
server_names = ['cloudflare']
```

Mask wpa_supplicant

```sh
systemctl mask wpa_supplicant
```

Enable NetworkManager and dnscrypt-proxy

```sh
systemctl enable NetworkManager dnscrypt-proxy
```

---

## 1. ZRAM setup

Create zram-generator config

```sh
# /etc/systemd/zram-generator.conf
[zram0]
zram-size = ram / 2
```

Reload daemon and start zram service

```sh
systemctl daemon-reload
systemctl start systemd-zram-setup@zram0.service
```

---

## 2. pacman

Uncomment and add in pacman

```sh
# /etc/pacman.conf
Color
VerbosePkgLists
ILoveCandy
```

---

## 3. keyd

Install and enable keyd

```sh
sudo pacman -Syu keyd

systemctl enable --now keyd
```

Configuration

```sh
# /etc/keyd/default.conf
[ids]

*

[main]

capslock = overload(control, esc)
```

```sh
sudo keyd reload
```

---

## 4. Git and yay

Install git and clone dotfiles

```sh
sudo pacman -Syu git

git clone --recurse-submodules https://github.com/morlipty/ywdsem.git
```

Install yay

```sh
git clone https://aur.archlinux.org/yay-bin.git

cd yay-bin
makepkg -si
```
