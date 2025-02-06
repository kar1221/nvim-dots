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
      menu = {
        border = "solid",
        scrollbar = false,
        draw = {
          treesitter = {
            "lsp",
          },
          gap = 2,
          components = {
            kind_icon = {
              ellipsis = false,
              text = function(ctx)
                local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
                return kind_icon
              end,
              highlight = function(ctx)
                return (require("blink.cmp.completion.windows.render.tailwind").get_hl(ctx) or "BlinkCmpKind")
                  .. ctx.kind
                -- local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                -- return hl
              end,
            },
          },
          columns = {
            {
              "kind_icon",
            },
            {
              "label",
            },
          },
        },
      },
    },
  },
}
