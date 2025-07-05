local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
  enableForWorkspaceTypeScriptVersions = true,
}

local servers = {
  -- CSS
  cssls = {
    settings = {
      css = {
        lint = {
          unknownAtRules = "ignore",
        },
      },
    },
  },

  -- TailwindCSS
  tailwindcss = {
    root_dir = function(fname)
      local package_json_path = vim.fs.dirname(vim.fs.find("package.json", { path = fname, upward = true })[1])
      if not package_json_path then
        return nil
      end

      local file = io.open(package_json_path .. "/package.json", "r")
      if not file then
        return nil
      end

      local found = false
      for line in file:lines() do
        if line:match('"tailwindcss"%s*:') or line:match([["@nuxt/ui"%s*:]]) then
          found = true
          break
        end
      end

      file:close()

      if found then
        return package_json_path
      else
        return nil
      end
    end,
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          },
        },
      },
    },
  },

  -- Vue
  volar = {
    on_init = function(client)
      client.handlers["tsserver/request"] = function(_, result, context)
        local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
        if #clients == 0 then
          vim.notify("Could not found `vtsls` lsp client, vue_lsp would not work without it.", vim.log.levels.ERROR)
          return
        end
        local ts_client = clients[1]

        local param = unpack(result)
        local id, command, payload = unpack(param)
        ts_client:exec_cmd({
          title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
          command = "typescript.tsserverRequest",
          arguments = {
            command,
            payload,
          },
        }, { bufnr = context.bufnr }, function(_, r)
          local response_data = { { id, r.body } }
          ---@diagnostic disable-next-line: param-type-mismatch
          client:notify("tsserver/response", response_data)
        end)
      end
    end,
  },

  -- vtsls
  vtsls = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
    },
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = { vue_plugin },
        },
      },
    },
  },
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = servers,
  },
}
