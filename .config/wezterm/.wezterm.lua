local wezterm = require("wezterm")
local config = {
	default_prog = { "zsh", "-c", "/opt/homebrew/bin/tmux" },
--	term = "xterm-256color-italic",
	font_size = 12,
	font = wezterm.font({
		family = "Monaspace Neon",
		weight = "Medium",
		--harfbuzz_features = { 'ss01', 'ss02', 'ss03', 'ss04', 'ss05', 'ss06', 'ss07', 'ss08', 'calt', 'dlig' },
	}),
	enable_tab_bar = false,
	color_scheme = "Kanagawa Dragon (Gogh)",
	colors = {
		background = "black",
		foreground = "white",
	},
}

return config
