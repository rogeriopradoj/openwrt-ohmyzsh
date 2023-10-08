#!/bin/sh

ZSH=${ZSH:-~/.oh-my-zsh}
REMOTE=${REMOTE:-https://codeload.github.com/ohmyzsh/ohmyzsh/tar.gz/refs/heads/master}

curl $REMOTE | tar xz -C /tmp > /dev/null || {
    printf "Download oh-my-zsh failed"
    exit 1
}
cp -rf /tmp/ohmyzsh-master/* $ZSH
rm -rf /tmp/ohmyzsh-master

# check plugins status
if [ ! -d "${ZSH}/plugins" ]; then
    plugins=false
else
    plugins=true
fi

# replace upgrade.sh
curl https://raw.githubusercontent.com/rogeriopradoj/openwrt-ohmyzsh/fork/upgrade.sh -O "${ZSH}/tools/upgrade.sh"
# patch to check_for_upgrade.sh
sed -i '/^whence git.*/d' "${ZSH}/tools/check_for_upgrade.sh"
# fix for remove lock file
mkdir "$ZSH/log/update.lock" 2>/dev/null

# remove plugins
if [[ $plugins != true ]]; then
    rm -rf "${ZSH}/plugins"
fi

printf "Update oh-my-zsh successful."
