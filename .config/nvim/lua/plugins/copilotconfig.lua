return {
	"github/copilot.vim",
	event = "VeryLazy",
	config = function()
		-- Copilot setup.
		vim.g.copilot_no_tab_map = false
		vim.g.copilot_assume_mapped = true
		vim.keymap.set(
			"i",
			"<C-l>",
			'copilot#Accept("<CR>")',
			{ noremap = true, silent = true, expr = true, replace_keycodes = false }
		)
	end,
}
