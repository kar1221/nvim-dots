return {
  "akinsho/toggleterm.nvim",
  version = "*",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      size = 20, -- Default size for horizontal and vertical terminals
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal", -- Default terminal direction
      close_on_exit = true, -- Close terminal window when process exits
      shell = vim.o.shell, -- Use the default shell
      float_opts = {
        border = "curved",
        width = 180,
        height = 45,
        winblend = 0,
      },
      highlights = {
        Normal = { link = "Normal" },
        NormalNC = { link = "NormalNC" },
        NormalFloat = { link = "NormalFloat" },
        FloatBorder = { link = "FloatBorder" },
        StatusLine = { link = "StatusLine" },
        StatusLineNC = { link = "StatusLineNC" },
        WinBar = { link = "WinBar" },
        WinBarNC = { link = "WinBarNC" },
      },
      winbar = {
        enabled = true,
        ---@param t Terminal
        name_formatter = function(t)
          return t.name
        end,
      },
    })
    local Terminal = require("toggleterm.terminal").Terminal

    ---@type Terminal[]
    local terminals = {}

    ---@param direction string
    function _NEW_TERMINAL(direction)
      local term = Terminal:new({ direction = direction })
      term:toggle()
      table.insert(terminals, term)
    end

    function _CLOSE_TERMINAL()
      if #terminals <= 0 then
        return nil
      end

      local top_term = terminals[#terminals]
      top_term:close()
      table.remove(terminals, #terminals)
    end

    -- Floating terminal
  end,
  keys = {
    {
      "<leader>tf",
      function()
        _NEW_TERMINAL("float")
      end,
      desc = "Toggle Float Terminal",
    },
    {
      "<leader>th",
      function()
        _NEW_TERMINAL("horizontal")
      end,
      desc = "Toggle Horizontal Terminal",
    },
    {
      "<leader>tv",
      function()
        _NEW_TERMINAL("vertical")
      end,
      desc = "Toggle Vertical Terminal",
    },
    {
      "<leader>tc",
      function()
        _CLOSE_TERMINAL()
      end,
      desc = "Close Top Most Terminal",
    },
  },
}
