local nvim_lsp = require("lspconfig")

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        denols = {
          init_options = {
            lint = true,
            unstable = true,
          },
          root_dir = nvim_lsp.util.root_pattern("deno.jsonc", "deno.json"),
        },
        vtsls = {
          single_file_support = false,
          root_dir = function(fname)
            return not nvim_lsp.util.root_pattern("deno.json", "deno.jsonc")(fname)
              and (
                nvim_lsp.util.root_pattern("tsconfig.json")(fname)
                or nvim_lsp.util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
                or nvim_lsp.util.root_pattern(".")(fname)
              )
          end,
        },
      },
    },
  },
}
