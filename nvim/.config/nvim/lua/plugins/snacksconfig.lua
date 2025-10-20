return {
  "folke/snacks.nvim",
  opts =  {
    input = { enabled = true },
    select = { enabled = true },
  },
  lazy = false,
  keys = {
    { "<leader>Z",  function() Snacks.zen.zoom() end, desc = "Toggle Zoom" },
  },
}
