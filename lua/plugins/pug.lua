return {
  { "digitaltoad/vim-pug" },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)

      local formatter = {
        pug = { "prettier" },
      }

      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft, formatter)
    end,
  },
}
