return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim", "onsails/lspkind.nvim" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      menu = {
        draw = {
          padding = 1,
          columns = {
            { "label" },
            { "kind_icon" },
            { "kind" },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                local icons = require("nvchad.icons.lspkind")
                local icon = (icons[ctx.kind] or "󰈚")

                return icon
              end,
            },
            kind = {
              highlight = function(ctx)
                return ctx.kind
              end,
            },
          },
        },
        scrollbar = false,
      },
    },

    keymap = {
      preset = "super-tab",
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<Tab>"] = {
        require("blink.cmp.keymap.presets").get("super-tab")["<Tab>"][1],
        require("lazyvim.util.cmp").map({ "snippet_forward", "ai_accept" }),
        "fallback",
      },
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
    fuzzy = {
      sorts = {
        "exact",
        -- defaults
        "score",
        "sort_text",
      },
    },
  },
}
