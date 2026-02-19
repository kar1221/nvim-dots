
return  {
  "GustavEikaas/easy-dotnet.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  config = function()
    require("easy-dotnet").setup()
  end,
  ft = { "cs" },
  keys = {
    { "<leader>ar", function ()
      local dotnet = require("easy-dotnet")
      dotnet.run()
    end, desc = "Run Dotnet Project" }
  }
}
