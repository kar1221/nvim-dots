return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "material-deep-ocean",
    },
  },

  {
    "AlexvZyl/nordic.nvim",
  },

  { "EdenEast/nightfox.nvim" }, -- lazy

  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    -- you can set set configuration options here
    -- config = function()
    --     vim.g.zenbones_darken_comments = 45
    --     vim.cmd.colorscheme('zenbones')
    -- end
  },

  {
    "nyoom-engineering/oxocarbon.nvim",
  },

  {
    "shaunsingh/nord.nvim",
  },

  {
    "Everblush/nvim",
    name = "everblush",
  },

  {
    "rose-pine/neovim",
  },

  {
    "catppuccin/nvim",
    opts = {
      no_italic = true,
    },
  },

  {
    "marko-cerovac/material.nvim",
    opts = {
      plugins = { -- Uncomment the plugins that you use to highlight them
        -- Available plugins:
        "blink",
        -- "coc",
        -- "colorful-winsep",
        "dap",
        -- "dashboard",
        -- "eyeliner",
        -- "fidget",
        -- "flash",
        -- "gitsigns",
        -- "harpoon",
        -- "hop",
        -- "illuminate",
        -- "indent-blankline",
        -- "lspsaga",
        "mini",
        -- "neo-tree",
        -- "neogit",
        -- "neorg",
        -- "neotest",
        -- "noice",
        -- "nvim-cmp",
        -- "nvim-navic",
        -- "nvim-notify",
        -- "nvim-tree",
        "nvim-web-devicons",
        -- "rainbow-delimiters",
        -- "sneak",
        -- "telescope",
        -- "trouble",
        "which-key",
      },
    },
  },
}
