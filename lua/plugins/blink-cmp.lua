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
        border = "padded",
        scrollbar = false,
        draw = {
          components = {
            bar = {
              text = function()
                return "󱋱"
              end,
              highlight = function(ctx)
                return (require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx) or "BlinkCmpKind")
                  .. ctx.kind
              end,
            },
          },
          padding = 2,
          columns = {
            { "kind_icon" },
            {
              "bar",
              "label",
              "label_description",
              gap = 1,
            },
            {
              "bar",
              "kind",
              gap = 1,
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
