# dot — work branch

Minimal macOS setup for a locked-down work laptop.

## Includes
* fish + fisher (plugin-git, fzf.fish)
* neovim (no AI plugins), tmux, ghostty config
* brew: fish, fzf, gh, git, git-extras, jq, neovim, ripgrep, the_silver_searcher, tmux, tree, wget
* Nerd fonts

## Excludes
* asdf, rustup and language packages — toolchains come from the company
* Ghostty itself — installed by the company
* Bitwarden key scripts, atuin, opencode, granted, GUI casks, Linux desktop configs

## Install
```
git clone -b work https://github.com/joerdav/dot.git ~/.dotfiles
~/.dotfiles/install.sh
chsh -s /opt/homebrew/bin/fish
```
