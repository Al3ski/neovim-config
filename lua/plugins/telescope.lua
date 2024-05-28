return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>fg"] = {
            function() require("telescope").extensions.live_grep_args.live_grep_args() end,
            desc = "Live grep words",
          },
        },
      },
    },
  },
}
