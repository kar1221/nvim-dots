return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim" },
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
    },
    signature = {
      enabled = true,
    },
    sources = {
      default = {
        "lsp",
        "path",
        "snippets",
        "buffer",
      },
    },
    completion = {
      accept = {
        create_undo_point = true,
      },
      ghost_text = {
        enabled = true,
      },
      menu = {
        border = "solid",
        scrollbar = false,
        draw = {
          padding = 2,
          columns = {
            {
              "label",
              "label_description",
              gap = 1,
            },
            {
              "kind_icon",
              "kind",
            },
          },
        },
      },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
  },
  opts_extend = {
    "sources.default",
  },
}
