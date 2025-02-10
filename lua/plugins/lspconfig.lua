return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      cssls = {
        settings = {
          css = {
            lint = {
              unknownAtRules = "ignore",
            },
          },
        },
      },
      -- tailwindcss = {
      --   settings = {
      --     tailwindCSS = {
      --       classAttributes = {
      --         "class",
      --         "className",
      --         "class:list",
      --         "classList",
      --         "ngClass",
      --         "active-class",
      --         "inactive-class",
      --       },
      --     },
      --   },
      -- },
      tailwindcss = {
        settings = {
          tailwindCSS = {
            experimental = {
              classRegex = {
                { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
                { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
                { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
              },
            },
          },
        },
      },
    },
  },
}
