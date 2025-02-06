local noice = require("noice")

local function is_deno_project()
  local bufnr = vim.api.nvim_get_current_buf()
  local clients = vim.lsp.get_clients({ bufnr = bufnr })

  for _, client in ipairs(clients) do
    if client.name == "denols" then
      return true
    end
  end

  return false
end

local function get_fmt()
  if is_deno_project() then
    return { "deno" }
  else
    return { "prettierd", "prettier", stop_after_first = true }
  end
end

return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      deno = {
        command = "deno fmt",
      },
    },
    formatters_by_ft = {
      javascript = function()
        return get_fmt()
      end,
      typescript = function()
        return get_fmt()
      end,
      -- Optional: Add these if you work with React files
      javascriptreact = function()
        return get_fmt()
      end,
      typescriptreact = function()
        return get_fmt()
      end,
    },
  },
}
