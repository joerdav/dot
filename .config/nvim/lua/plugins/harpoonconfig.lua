return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "[H]arpoon Menu" })
		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-u>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-y>", function()
			harpoon:list():select(4)
		end)
	end,
}
