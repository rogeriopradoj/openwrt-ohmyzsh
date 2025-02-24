# oh-my-zsh on openwrt

> - https://github.com/rogeriopradoj/openwrt-ohmyzsh/tree/fork
> - forked from https://github.com/felix-fly/openwrt-ohmyzsh

Install oh-my-zsh on a openwrt router without git and git-http installed. It's base on the official scripts.

Package git and git-http are so large for a cheap router with a little storage.

## dependence packages

* zsh

```bash
opkg update
opkg install zsh
```

## Install

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/rogeriopradoj/openwrt-ohmyzsh/fork/install.sh)"
```

## Set zsh default

```bash
which zsh && sed -i -- 's:/bin/ash:'`which zsh`':g' /etc/passwd
```

Relogin your router, you'll see oh-my-zsh here.

## Uninstall

```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/rogeriopradoj/openwrt-ohmyzsh/fork/uninstall.sh)"
```

## Issues

If you meet this error:

```bash
regexp-replace:28: failed to load module: zsh/regex
regexp-replace:28: -regex-match not available for regex
```

You can remove the following file to fix it.

```bash
mv ~/.oh-my-zsh/lib/vcs_info.zsh ~/.oh-my-zsh/lib/vcs_info.zsh.bak
```
