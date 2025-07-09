local M = {}

-- @param start_path  (string) a file or directory path in your project
-- @param pkg_names   (string|table) a single package name or list of names to search for
-- @return (string|nil) the directory containing that package.json, or nil if none found
function M.find_pkg_dir(start_path, pkg_names)
  local names = {}
  if type(pkg_names) == "string" then
    names = { pkg_names }
  elseif type(pkg_names) == "table" then
    names = pkg_names
  else
    error("find_pkg_dir: pkg_names must be string or table")
  end

  -- locate nearest package.json
  local results = vim.fs.find("package.json", { path = start_path, upward = true })
  if not results or #results == 0 then
    -- vim.notify("find_pkg_dir: no package.json found from " .. start_path, vim.log.levels.WARN)
    return nil
  end
  local pkg_dir = vim.fs.dirname(results[1])
  local pkg_file = pkg_dir .. "/package.json"
  -- vim.notify("find_pkg_dir: reading " .. pkg_file, vim.log.levels.INFO)

  local lines = vim.fn.readfile(pkg_file)
  if not lines then
    -- vim.notify("find_pkg_dir: could not read " .. pkg_file, vim.log.levels.ERROR)
    return nil
  end
  local content = table.concat(lines, "\n")

  local ok, data = pcall(vim.fn.json_decode, content)
  if not ok or type(data) ~= "table" then
    -- vim.notify("find_pkg_dir: failed to parse JSON in " .. pkg_file, vim.log.levels.ERROR)
    return nil
  end

  for _, name in ipairs(names) do
    if (data.dependencies and data.dependencies[name]) or (data.devDependencies and data.devDependencies[name]) then
      -- vim.notify("find_pkg_dir: found `" .. name .. "` in " .. pkg_file, vim.log.levels.INFO)
      return pkg_dir
    end
  end

  return nil
end

return M
