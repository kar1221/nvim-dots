return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
    },
    completion = {
      menu = {
        scrollbar = false,
        draw = {
          padding = 2,
          columns = {
            { "label" },
            { "kind_icon" },
            { "kind" },
          },
          components = {
            kind_icon = {
              text = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, _ = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then
                    return mini_icon .. ctx.icon_gap
                  end
                end

                local icon = require("lspkind").symbolic(ctx.kind, { mode = "symbol" })
                return icon .. ctx.icon_gap
              end,

              -- Optionally, use the highlight groups from mini.icons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then
                    return mini_hl
                  end
                end
                return ctx.kind_hl
              end,
            },
            kind = {
              -- Optional, use highlights from mini.icons
              highlight = function(ctx)
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local mini_icon, mini_hl = require("mini.icons").get_icon(ctx.item.data.type, ctx.label)
                  if mini_icon then
                    return mini_hl
                  end
                end
                return ctx.kind_hl
              end,
            },
          },
        },
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
        snippets = {
          score_offset = 8,
        },
        buffer = {
          score_offset = 7,
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
