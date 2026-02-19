return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufEnter",
  opts = function()
    require("nvim-highlight-colors").setup({})
  end,
}
