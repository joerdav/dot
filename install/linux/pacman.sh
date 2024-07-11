set -eEuo pipefail

apps=(
  atiun
  cmake
  coreutils
  fzf
  github-cli
  git
  # https://github.com/tj/git-extras/blob/master/Commands.md
  git-extras
  grep
  gpg2
  jq
  neovim
  ripgrep
  the_silver_searcher
  tmux
  tree
  wget
  firefox
  google-chrome
  # Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
  spotify
  code
  vlc
  wezterm
  #font-fira-code-nerd-font
  #font-hack-nerd-font
  #font-roboto-mono-nerd-font
  #font-space-mono-nerd-font
  #font-meslo-lg-nerd-font
)

pacman -Syu --noconfirm $(apps)
