local start_time = vim.uv.hrtime()

local get_buf_name = function()
  return vim.fn.expand("%:t")
end

local get_buf_ft = function()
  return vim.bo.filetype
end

local get_time = function()
  local elapsed_time = vim.uv.hrtime() - start_time
  local total = math.floor(elapsed_time / 1e9)

  local h = math.floor(total / 3600)
  local m = math.floor((total % 3600) / 60)
  local s = total % 60

  return string.format("%02d:%02d:%02d", h, m, s)
end

return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "auto",
      component_separators = "",
      section_separators = { left = "", right = "" },
    },
    sections = {
      lualine_a = { { "mode", separator = { left = "", right = "" }, right_padding = 2 } },
      lualine_b = {
        { get_buf_name },
        { "branch", separator = { right = "" } },
      },
      lualine_c = {
        { "diagnostics" },
      },
      lualine_x = { "lsp_status" },
      lualine_y = { get_buf_ft },
      lualine_z = {
        { get_time, separator = { left = "", right = "" }, left_padding = 0 },
      },
    },
    inactive_sections = {
      lualine_a = { "filename" },
      lualine_b = {},
      lualine_c = {},
      lualine_x = {},
      lualine_y = {},
      lualine_z = { "location" },
    },
    tabline = {},
    extensions = {},
  },
}
