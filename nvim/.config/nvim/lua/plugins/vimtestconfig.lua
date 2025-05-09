--return {
	--"vim-test/vim-test",
	--event = "VeryLazy",
	--config = function()
		--vim.g["test#strategy"] = "vimux"
		--vim.cmd([[
			--let test#go#gotest#options = {
			  --\ 'all':   '-cover --coverprofile=coverage.out',
			--\}
			--]])

		--require("coverage").setup({
			--commands = true, -- create commands
			--signs = {
				---- use your own highlight groups or text markers
				--covered = { hl = "String", text = "▎" },
				--uncovered = { hl = "Constant", text = "▎" },
			--},
		--})
		--vim.g["gotests_template"] = ""
	--end,
--}
return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"nvim-neotest/neotest-go",
		"nvim-neotest/neotest-jest"
	},
	config = function ()
		local neotest = require("neotest")
		neotest.setup({
			adapters = {
				require("neotest-go"),
				require("neotest-jest")
			},
		})

		vim.keymap.set(
			"n",
			"<leader>ts",
			neotest.summary.toggle,
			{ silent = true, noremap = true, desc = "[T]est [S]ummary" }
		)
	end 
}
