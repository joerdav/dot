return {
	"nvim-telescope/telescope.nvim",
	lazy = false,
	dependencies = {
		{ "joerdav/telescope-xc.nvim" },
		"nvim-lua/plenary.nvim",
		"preservim/vimux",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	config = function()
		vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>', {noremap = true, silent = true}) 
		local builtin = require("telescope.builtin")
		local actions = require('telescope.actions')
		vim.keymap.set(
			"n",
			"<leader>sf",
			':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
			{ silent = true, noremap = true, desc = "[S]earch [F]iles" }
		)
		vim.keymap.set(
			"n",
			"<leader>sg",
			builtin.live_grep,
			{ silent = true, noremap = true, desc = "[S]earch [G]rep" }
		)
		vim.keymap.set(
			"n",
			"<leader>sb",
			builtin.buffers,
			{ silent = true, noremap = true, desc = "[S]earch [B]uffers" }
		)
		vim.keymap.set(
			"n",
			"<leader>sc",
			builtin.commands,
			{ silent = true, noremap = true, desc = "[S]earch [C]ommands" }
		)

		require("telescope").load_extension("xc")
		vim.keymap.set("n", "<leader>xc", require("telescope").extensions["xc"].run_task, { desc = "[X][C] Tasks" })
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown {
						layout_strategy = "center",
						layout_config = {
							height = 20,
							width = 100,
						},

					}
				}
			},
			defaults = {
				file_ignore_patterns = {
					'node%_modules',
					'%_cache',
					'%.git/',
					'site%_libs',
					'%.venv/',
					'%_files/libs/',
					'%.obsidian/',
					'%.quarto/',
					'%_freeze/',
				},
				mappings = {
					i = {
						["<c-d>"] = actions.delete_buffer,
					},
					n = {
						["<c-d>"] = actions.delete_buffer,
						["dd"] = actions.delete_buffer,
					},
				}
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
