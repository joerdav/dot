return {
  "HotThoughts/jjui.nvim",
  cmd = {
    "JJUI",
    "JJUICurrentFile",
    "JJUIFilter",
    "JJUIFilterCurrentFile",
    "JJConfig",
  },
  keys = {
    { "<leader>jj", "<cmd>JJUI<cr>", desc = "JJUI" },
    { "<leader>jc", "<cmd>JJUICurrentFile<cr>", desc = "JJUI (current file)" },
    { "<leader>jl", "<cmd>JJUIFilter<cr>", desc = "JJUI log" },
    { "<leader>jf", "<cmd>JJUIFilterCurrentFile<cr>", desc = "JJUI log (current file)" },
  },
  config = function()
    require("jjui").setup()
  end,
}
