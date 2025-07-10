local find_pkg = require("util.find_pkg").find_pkg_dir

if true then
  return {}
end

return {
  "conform.nvim",
  opts = function(_, opts)
    opts.formatters_by_ft = opts.formatters_by_ft or {}

    local is_using_antfu = find_pkg(vim.fn.getcwd(), "@antfu/eslint-config")

    local ft = vim.bo.filetype

    local default_formatters = {
      vue = opts.formatters_by_ft.vue or {},
      javascript = opts.formatters_by_ft.javascript or {},
      typescript = opts.formatters_by_ft.typescript or {},
    }

    local formatter = {}

    if is_using_antfu then
      -- vim.notify("Project is using antfu, disabling formatters.", vim.log.levels.INFO)
      formatter = {}
    else
      formatter = default_formatters[ft] or {}
    end

    opts.formatters_by_ft[ft] = formatter

    local joined = #opts.formatters_by_ft[ft] > 0 and table.concat(opts.formatters_by_ft[ft], ", ") or "none"
    vim.notify("Current Formatter : " .. joined, vim.log.levels.INFO)
  end,
}
