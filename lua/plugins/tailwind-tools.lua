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
    server = {
      override = false,
      settings = {
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "([a-zA-Z0-9\\-:]+)" },
          },
        },
        classAttributes = {
          "class",
          "className",
          "class:list",
          "classList",
          "ngClass",
          "active-class",
          "inactive-class",
        },
      },
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
