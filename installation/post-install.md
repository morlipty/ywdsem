## 0. dnscrypt and iwd configuration

Fallback to dnscrypt

```sh
#/etc/resolv.conf

nameserver 127.0.0.1
options edns0
```

And make resolv.conf immutable

```sh
sudo chattr +i /etc/resolv.conf
```

Diable wifi power saving

```sh
#/etc/iwd/main.conf

[DriverQuirks]
PowerSaveDisable=*
```

Make iwd wifi backend

```sh
#/etc/NetworkManager/conf.d/wifi_backend.conf

[device]
wifi.backend=iwd
```

Add quad9 server name to dnscrypt-proxy config

```sh
#/etc/dnscrypt-proxy/dnscrypt-proxy.toml

server_names = ['quad9-dnscrypt-ip4-filter-pri']
```

---

## 1. ZRAM setup

```sh

#/etc/systemd/zram-generator.conf
[zram0]
zram-size = ram / 2
compression-algorithm = zstd
```

```sh
sudo systemctl daemon-reload
sudo systemctl start systemd-zram-setup@zram0.service
```

---

## 2. pacman

Uncomment and add

```sh
#/etc/pacman.conf

Color
VerbosePkgLists
ILoveCandy
```

---

## 3. keyd

```sh
sudo pacman -Syu keyd
sudo systemctl enable --now keyd
```

```sh
#/etc/keyd/default.conf

[ids]

*

[main]

capslock = overload(control, esc)

esc = capslock
```
