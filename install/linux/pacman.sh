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
install grep
install jq
install make
install neovim
install the_silver_searcher
install tmux
install tree
install wget
install firefox
install code
install vlc
install ghostty


