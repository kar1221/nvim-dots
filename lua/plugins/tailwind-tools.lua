-- tailwind-tools.lua
return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim", -- optional
    "neovim/nvim-lspconfig", -- optional
  },
  keys = {
    {
      "<leader>ctc",
      "<cmd>TailwindConcealToggle<cr>",
      desc = "Toggle Tailwind Conceal",
    },
  },
  opts = {
    conceal = {
      enabled = true,
    },
    extension = {
      patterns = {
        vue = { "active%-class=[\"']([^\"']+)[\"']" },
      },
    },
  }, -- your configuration
}
