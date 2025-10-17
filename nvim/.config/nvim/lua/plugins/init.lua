return {
	{
		"preservim/nerdcommenter",
		keys = {
			{ "<leader>c<space>", "<cmd>NERDCommenterToggle<CR>" },
		},
		opts = {},
	},
	{
		"tpope/vim-abolish",
		event = "BufReadPre",
	},
	{
		"tpope/vim-sleuth",
		event = "BufReadPre",
	},
	{ 
		"tpope/vim-fugitive",
		lazy = false,
	},
	{
		"rhysd/vim-grammarous",
		event = "BufReadPre",
	},
	{
		"farmergreg/vim-lastplace",
		event = "BufReadPre",
	},
	{
		"tpope/vim-surround",
		lazy = false,
	},
	{
		"jiangmiao/auto-pairs",
		config = function()
			vim.g.utoPairsMultilineClose = 0
		end,
		lazy = false,
	},
	{
		"mg979/vim-visual-multi",
		lazy = false,
	},
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},
}
