#!/usr/bin/env zsh

set -eEuo pipefail

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

#if [[ -z "${BW_CLIENTSECRET}" ]]; then
    echo "Bitwarden client secret: "
    read -n BW_CLIENTSECRET
    export BW_CLIENTSECRET="$BW_CLIENTSECRET"
#fi
#if [[ -z "${BW_CLIENTID}" ]]; then
    echo "Bitwarden client id: "
    read -n BW_CLIENTID
    export BW_CLIENTID="$BW_CLIENTID"
#fi
#if [[ -z "${BW_PASSWORD}" ]]; then
    echo "Bitwarden password: "
    read -n BW_PASSWORD
    export BW_PASSWORD="$BW_PASSWORD"
#fi

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

#if is-executable git -a -d "$DOTFILES_DIR/.git"; then git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master; fi

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/.config/zsh/.zshrc" "$HOME"
ln -sfv "$DOTFILES_DIR/.config/.Xresources" "$HOME"
ln -sfv "$DOTFILES_DIR/.config/.profile" "$HOME"
ln -sfv "$DOTFILES_DIR/.config/zsh/.zshrc" "$HOME"
ln -sfv "$DOTFILES_DIR/.config/tmux/.tmux.conf" "$HOME"
ln -sfv "$DOTFILES_DIR/.config/nvim" "$HOME/.config"
ln -sfv "$DOTFILES_DIR/.config/i3" "$HOME/.config"
ln -sfv "$DOTFILES_DIR/.config/wezterm/.wezterm.lua" "$HOME"
ln -sfv "$DOTFILES_DIR/lang_defaults/.default_npm_packages" "$HOME"
ln -sfv "$DOTFILES_DIR/lang_defaults/.default-golang-pkgs" "$HOME"

# Package managers & pagkages
. "$DOTFILES_DIR/install/packages.sh"
. "$DOTFILES_DIR/install/asdf_install.sh"
#if [ ! -z "$NEWKEY" ]; then
    #. "$DOTFILES_DIR/install/autokey-github.sh"
#else
    #. "$DOTFILES_DIR/install/pull-ssh-keys.sh"
#fi

#ln -sfv "$DOTFILES_DIR/git/.gitconfig" "$HOME"
#ln -sfv "$DOTFILES_DIR/git/.githelpers" "$HOME"

# Install extra stuff

PATH="$HOME/.cargo/bin:$PATH"

echo "Installing zsh"

. "$DOTFILES_DIR/install/zsh_install.sh"

if test -f .zshrc.pre-oh-my-zsh; then
    rm .zshrc
    mv .zshrc.pre-oh-my-zsh .zshrc
fi
