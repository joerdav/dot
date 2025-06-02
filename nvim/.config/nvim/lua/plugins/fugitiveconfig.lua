return {
	"tpope/vim-fugitive",
	config = function()
		vim.keymap.set("n", "gh", '<cmd>diffget //2<cr>', { desc = "[G]itdiff Accept [h]left" })
		vim.keymap.set("n", "gl", '<cmd>diffget //3<cr>', { desc = "[G]itdiff Accept [l]right" })
	end,
}
