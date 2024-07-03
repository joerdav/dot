if ! is-macos -o ! is-executable brew; then
  echo "Skipped: Homebrew-Cask"
  return
fi

brew tap homebrew/cask
brew tap homebrew/cask-fonts

# Install packages
apps=(
  bitwarden
  firefox
  google-chrome
  rectangle
  # Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
  spotify
  visual-studio-code
  vlc
  webpquicklook
)

brew install "${apps[@]}" --cask

# Install fonts
fonts=(
  font-fira-code-nerd-font
  font-hack-nerd-font
  font-roboto-mono-nerd-font
  font-space-mono-nerd-font
  font-meslo-lg-nerd-font
)

brew install "${fonts[@]}" --cask
