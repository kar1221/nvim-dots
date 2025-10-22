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

  emmet_language_server = {},
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
