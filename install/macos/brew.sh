if ! is-macos -o ! is-executable ruby -o ! is-executable curl -o ! is-executable git; then
  echo "Skipped: Homebrew (missing: ruby, curl and/or git)"
  return
fi
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew update
brew upgrade

apps=(
  atuin
  cmake
  coreutils
  fzf
  gh
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
)

brew install "${apps[@]}"

export DOTFILES_BREW_PREFIX_COREUTILS=$(brew --prefix coreutils)
