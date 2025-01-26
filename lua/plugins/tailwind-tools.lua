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
  opts = {
    server = {
      override = false,
    },
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
