local servers = {
  -- CSS
  cssls = {
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },

  rust_analyzer = {
    mason = false,
  },

  oxlint = {
    -- opt in to early changes from this PR, these can be removed when it
    -- gets merged
    -- https://github.com/neovim/nvim-lspconfig/pull/4242
    cmd = { "oxlint", "--lsp" },
    on_attach = function(client, bufnr)
      vim.api.nvim_buf_create_user_command(bufnr, "LspOxlintFixAll", function()
        client:exec_cmd({
          title = "Apply Oxlint automatic fixes",
          command = "oxc.fixAll",
          arguments = { { uri = vim.uri_from_bufnr(bufnr) } },
        })
      end, {
        desc = "Apply Oxlint automatic fixes",
      })
    end,
    mason = false,
  },

  tailwindcss = {
    settings = {
      tailwindCSS = {
        includeLanguages = {
          eelixir = "html-eex",
          elixir = "html-eex",
          eruby = "erb",
          heex = "html-eex",
          htmlangular = "html",
          templ = "html",
          pug = "html",
        },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        classAttributes = {
          "class",
          "ui",
        },
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "ui:\\s*{([^)]*)\\s*}", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          },
        },
      },
    },
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "pug",
    },
  },

  qmlls = {
    cmd = { "qmlls6" },
    filetypes = { "qml", "qmljs" },
  },
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = servers,
    inlay_hints = { enabled = true },
  },
}
