return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },
  {
    "Everblush/nvim",
    name = "everblush",
  },
  {
    "kdheepak/monochrome.nvim",
  },
  {
    "ellisonleao/gruvbox.nvim",
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
    "rose-pine/neovim",
    name = "rose-pine",
    opts = {
      styles = {
        italic = false,
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
  {
    "kepano/flexoki-neovim",
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      defaults = {
        styles = {
          comments = { italic = false },
          keywords = { italic = false },
        },
      },
    },
  },
  {
    "shaunsingh/nord.nvim",
    name = "Nord-shaun",
  },
  {
    "gbprod/nord.nvim",
    name = "Nord-gbp",
  },
  {
    "psliwka/termcolors.nvim",
  },
}
