return {
  "nvim-treesitter/nvim-treesitter",
  -- opts = function(_, opts)
  --   opts.ensure_installed = opts.ensure_installed or {}
  --
  --   if not vim.tbl_contains(opts.ensure_installed, "ejs") then
  --     table.insert(opts.ensure_installed, "ejs")
  --   end
  -- end,

  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    vim.filetype.add({
      extension = {
        ejs = "ejs",
      },
    })

    for _, lang in ipairs({ "html", "javascript", "embedded_template" }) do
      vim.treesitter.language.register(lang, "ejs")
    end
  end,
}
