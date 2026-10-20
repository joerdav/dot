if ! is-executable brew; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

brew update

apps=(
  fish
  fzf
  gh
  git
  # https://github.com/tj/git-extras/blob/master/Commands.md
  git-extras
  jq
  neovim
  ripgrep
  the_silver_searcher
  tmux
  tree
  wget
)

brew install "${apps[@]}"
