#!/usr/bin/env bash
# Minimal macOS setup for the work laptop. Toolchains are managed by the company.

set -eEuo pipefail

export DOTFILES_DIR="$HOME/.dotfiles"
PATH="$DOTFILES_DIR/bin:$PATH"

if [[ $(is-macos) != 0 ]]; then
    echo "work branch supports macOS only" >&2
    exit 1
fi

mkdir -p "$HOME/.config"
ln -sfv "$DOTFILES_DIR/profile/.profile" "$HOME"
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" "$HOME"
for d in nvim fish ghostty jj; do
    ln -sfnv "$DOTFILES_DIR/$d/.config/$d" "$HOME/.config/$d"
done

. "$DOTFILES_DIR/install/macos/brew.sh"
. "$DOTFILES_DIR/install/macos/brew-cask.sh"

fish -c 'curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher update'
