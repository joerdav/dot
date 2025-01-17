if [ ! -d ~/.nerd-fonts ]; then
	git clone --depth=1 https://github.com/ryanoasis/nerd-fonts ~/.nerd-fonts
fi

~/.nerd-fonts/install.sh

if [ ! -d ~/.monaspace-fonts ]; then
	git clone --depth=1 https://github.com/githubnext/monaspace ~/.monaspace-fonts
fi

~/.monaspace-fonts/util/install_linux.sh

sudo ln -sfv $HOME/.dotfiles/system/fonts/icomoon-feather.ttf /usr/share/fonts
sudo ln -sfv $HOME/.dotfiles/system/fonts/icomoon-feather.ttf_ /usr/share/fonts
sudo ln -sfv $HOME/.dotfiles/system/fonts/siji.pcf /usr/share/fonts
