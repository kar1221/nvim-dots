return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },

  {
    "olimorris/onedarkpro.nvim",
    lazy = true,
  },

  {
    "AlexvZyl/nordic.nvim",
    lazy = true,
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
    lazy = true,
  },

  {
    "Everblush/nvim",
    name = "everblush",
    lazy = true,
  },

  {
    "rose-pine/neovim",
    lazy = true,
  },

  {
    "catppuccin/nvim",
    lazy = true,
    opts = {
      no_italic = true,
      transparent_background = true,

      float = {
        transparent = true, -- enable transparent floating windows
      },

      auto_integrations = true,
    },
  },

  {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
}
