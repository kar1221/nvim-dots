return {
  "oribarilan/lensline.nvim",
  event = "LspAttach",
  branch = "release/1.x",
  config = function()
    require("lensline").setup()
  end,
}
