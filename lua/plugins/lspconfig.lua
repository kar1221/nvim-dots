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
      tailwindcss = {
        experimental = {
          classRegex = {
            "(?:class: ?)(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",
            "(?:active-class: ?)(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",
            "(?:inactive-class: ?)(?:'|\"|`)([^\"'`]*)(?:'|\"|`)",
          },
        },
      },
    },
  },
}
