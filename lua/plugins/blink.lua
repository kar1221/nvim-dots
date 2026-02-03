return {
  "saghen/blink.cmp",
  build = "cargo +nightly-2025-09-30 build --release",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "super-tab",
    },
    completion = {
      list = {
        selection = {
          preselect = false,
          auto_insert = false
        },
      },
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

              -- Optionally, use the highlight groups from nvim-web-devicons
              -- You can also add the same function for `kind.highlight` if you want to
              -- keep the highlight groups in sync with the icons.
              highlight = function(ctx)
                local hl = ctx.kind_hl
                if vim.tbl_contains({ "Path" }, ctx.source_name) then
                  local dev_icon, dev_hl = require("nvim-web-devicons").get_icon(ctx.label)
                  if dev_icon then
                    hl = dev_hl
                  end
                end
                return hl
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
