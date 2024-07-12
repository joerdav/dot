set -eEuo pipefail

function install {

    if [[ $(which "$1" &>/dev/null) -ne 0 ]]; then
        echo "Installing: ${1}..."
        sudo pacman -Syu --noconfirm "$1"
    else
        echo "Already installed: ${1}"
    fi
}


install atiun
install cmake
install coreutils
install fzf
install github-cli
install git
# https://github.com/tj/git-extras/blob/master/Commands.md
install git-extras
install grep
install gpg2
install jq
install neovim
install ripgrep
install the_silver_searcher
install tmux
install tree
install wget
install firefox
install google-chrome
# Quick Look Plugins (https://github.com/sindresorhus/quick-look-plugins)
install spotify
install code
install vlc
install wezterm


