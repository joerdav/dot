#! /usr/bin/bash

function linux_install() {
    . /etc/os-release
    OS=$NAME
    LINUX_DIR="$DOTFILES_DIR/install/linux"
    if [[ $OS == *"Manjaro"* ]]; then
        . "$LINUX_DIR/pacman.sh"
    fi
    . "$LINUX_DIR/fonts.sh"
    fc-cache -fv
    # install kitty
    mkdir -p ~/.local/bin
}

function macos_install() {
    . "$DOTFILES_DIR/install/macos/brew.sh"
    . "$DOTFILES_DIR/install/macos/brew-cask.sh"
}

if [[ $(is-macos) == 0 ]]; then
    macos_install
else
    linux_install
fi
