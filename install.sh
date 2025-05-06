#!/usr/bin/env zsh

set -eEuo pipefail

# Get current dir (so run this script from anywhere)

export DOTFILES_DIR DOTFILES_CACHE DOTFILES_EXTRA_DIR
DOTFILES_DIR="$HOME/.dotfiles"
DOTFILES_CACHE="$DOTFILES_DIR/.cache.sh"

# Make utilities available

PATH="$DOTFILES_DIR/bin:$PATH"

# Update dotfiles itself first

# Bunch of symlinks
if [[ $(is-macos) == 0 ]]; then
    ln -sfv "$DOTFILES_DIR/.config/.Xresources" "$HOME"
    ln -sfv "$DOTFILES_DIR/.config/.profile" "$HOME"
fi
ln -sfv "$DOTFILES_DIR/.config/tmux/.tmux.conf" "$HOME"
ln -sfv "$DOTFILES_DIR/.config/nvim" "$HOME/.config"
ln -sfv "$DOTFILES_DIR/.config/fish" "$HOME/.config"
ln -sfv "$DOTFILES_DIR/.config/atuin" "$HOME/.config"
ln -sfv "$DOTFILES_DIR/.config/ghostty" "$HOME/.config"
ln -sfv "$DOTFILES_DIR/.config/i3" "$HOME/.config"
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
