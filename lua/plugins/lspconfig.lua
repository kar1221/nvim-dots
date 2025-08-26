local servers = {
  html = {
    filetypes = {
      "html",
      "ejs",
    },
  },

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


  eslint = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "html",
      "markdown",
      "json",
      "jsonc",
      "yaml",
      "toml",
      "xml",
      "gql",
      "graphql",
      "astro",
      "svelte",
      "css",
      "less",
      "scss",
      "pcss",
      "postcss",
    },
  },
  pug = {},
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = servers,
    inlay_hints = { enabled = false },
  },
}
