return {
  {
    "akinsho/bufferline.nvim",
    init = function()
      local bufline = require("catppuccin.groups.integrations.bufferline")
      function bufline.get()
        return bufline.get_theme()
      end
    end,
  },
  {
    "LazyVim/LazyVim",
    url = "https://github.com/dpetka2001/LazyVim",
    branch = "fix/mason-v2",
  },
}
