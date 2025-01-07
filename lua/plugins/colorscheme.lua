return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      transparent_background = true,
      flavour = "mocha",
    },
    intergrations = {
      cmp = true,
      gitsign = true,
      nvimtree = true,
      mason = true,
      blink_cmp = true,
      treesitter = true,
    },
  },
}
