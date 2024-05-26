return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  config = function()
    require("cinnamon").setup {
      extra_keymaps = true,
      extended_keymaps = true,
      always_scroll = true,
    }
  end,
}
