return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim" },
  version = "*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
    },
    signature = {
      enabled = true,
    },
    sources = {
      providers = {
        lsp = {
          async = true,
          score_offset = 10,
        },
        path = {
          score_offset = 9,
        },
        buffer = {
          score_offset = 8,
        },
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
        border = "single",
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
}
