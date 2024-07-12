set -eEuo pipefail

function install {
	echo "Installing: ${1}..."
	sudo pacman -Syu --noconfirm "$1"
}


install atuin
install cmake
install coreutils
install fzf
install gcc
install github-cli
install git
# https://github.com/tj/git-extras/blob/master/Commands.md
install grep
install jq
install make
install neovim
install ripgrep
install the_silver_searcher
install tmux
install tree
install wget
install firefox
install code
install vlc
install wezterm


