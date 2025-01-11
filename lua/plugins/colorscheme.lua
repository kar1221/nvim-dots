return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-mocha",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    opts = {
      flavour = "mocha",
      no_italic = true,
      intergrations = {
        cmp = true,
        gitsign = true,
        nvimtree = true,
        mason = true,
        blink_cmp = true,
        treesitter = true,
      },
    },
  },
  {
    "bettervim/yugen.nvim",
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "navarasu/onedark.nvim",
    opts = {
      style = "deep",
    },
  },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
  },
}
