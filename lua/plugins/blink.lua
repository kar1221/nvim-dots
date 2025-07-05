return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", "moyiz/blink-emoji.nvim", "onsails/lspkind.nvim" },

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    completion = {
      ghost_text = {
        enabled = false,
      },
      menu = {
        draw = {
          components = {
            kind_icon = {
              text = function(ctx)
                local icon = ctx.kind_icon
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    icon = dev_icon
                  end
                else
                  icon = require("lspkind").symbolic(ctx.kind, {
                    mode = "symbol",
                  })
                end

                return icon .. ctx.icon_gap
              end,
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
            kind = {
              highlight = function(ctx)
                local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
                return hl
              end,
            },
          },
          padding = 2,
          columns = {
            { "label" },
            { "kind_icon" },
            { "kind" },
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
        function(a, b)
          if (a.client_name == nil or b.client_name == nil) or (a.client_name == b.client_name) then
            return
          end
          return b.client_name == "emmet_ls"
        end,
        -- defaults
        "score",
        "sort_text",
      },
    },
  },
}
