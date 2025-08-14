local find_pkg = require("util").find_pkg_dir

local vue_language_server_path = vim.fn.stdpath("data")
  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
  enableForWorkspaceTypeScriptVersions = true,
}

local customizations = {
  { rule = "style/*", severity = "off", fixable = true },
  { rule = "format/*", severity = "off", fixable = true },
  { rule = "*-indent", severity = "off", fixable = true },
  { rule = "*-spacing", severity = "off", fixable = true },
  { rule = "*-spaces", severity = "off", fixable = true },
  { rule = "*-order", severity = "off", fixable = true },
  { rule = "*-dangle", severity = "off", fixable = true },
  { rule = "*-newline", severity = "off", fixable = true },
  { rule = "*quotes", severity = "off", fixable = true },
  { rule = "*semi", severity = "off", fixable = true },
}

local servers = {
  html = {
    filetypes = {
      "html",
      "ejs",
    },
  },

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
      return find_pkg(fname, { "tailwindcss", "@nuxt/ui" })
    end,
    settings = {
      tailwindCSS = {
        includeLanguages = {
          eelixir = "html-eex",
          elixir = "html-eex",
          eruby = "erb",
          heex = "html-eex",
          htmlangular = "html",
          templ = "html",
          pug = "html",
        },
        lint = {
          cssConflict = "warning",
          invalidApply = "error",
          invalidConfigPath = "error",
          invalidScreen = "error",
          invalidTailwindDirective = "error",
          invalidVariant = "error",
          recommendedVariantOrder = "warning",
        },
        classAttributes = {
          "class",
          "ui",
        },
        experimental = {
          classRegex = {
            { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "cx\\(([^)]*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
            { "cn\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
            { "ui:\\s*{([^)]*)\\s*}", "(?:'|\"|`)([^']*)(?:'|\"|`)" },
          },
        },
      },
    },
    filetypes = {
      "html",
      "css",
      "scss",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "pug", -- Added "pug" here
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

  svelte = {
    on_attach = function(client, _)
      if client.name == "svelte" then
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
          pattern = { "*.js", "*.ts" },
          callback = function(ctx)
            client:notify("$/onDidChangeTsOrJsFile", {
              uri = ctx.match,
            })
          end,
        })
      end
    end,
  },

  eslint = {
    filetypes = {
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "html",
      "markdown",
      "json",
      "jsonc",
      "yaml",
      "toml",
      "xml",
      "gql",
      "graphql",
      "astro",
      "svelte",
      "css",
      "less",
      "scss",
      "pcss",
      "postcss",
    },
    on_attach = function(_, bufnr)
      -- if find_pkg(vim.fn.getcwd(), "@antfu/eslint-config") then
      --   vim.api.nvim_create_autocmd("BufWritePre", {
      --     buffer = bufnr,
      --     command = "EslintFixAll",
      --   })
      -- end
    end,
    -- settings = {
    --   -- Silent the stylistic rules in you IDE, but still auto fix them
    --   rulesCustomizations = customizations,
    -- },
  },
  pug = {},
}

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = servers,
    inlay_hints = { enabled = false },
  },
}
