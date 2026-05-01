return {
  "https://github.com/neovim/nvim-lspconfig",
  config = function()
    local vue_language_server_path = vim.fn.expand "$MASON/packages"
      .. "/vue-language-server"
      .. "/node_modules/@vue/language-server"
    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
      languages = { "vue" },
      configNamespace = "typescript",
    }
    local vtsls_config = {
      settings = {
        vtsls = {
          tsserver = {
            globalPlugins = {
              vue_plugin,
            },
          },
        },
      },
      filetypes = tsserver_filetypes,
    }

    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      filetypes = tsserver_filetypes,
    }

    -- If you are on most recent `nvim-lspconfig`
    local vue_ls_config = {}
    -- LSP keymaps setup when attached
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local opts = { buffer = event.buf, silent = true }
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, { desc = desc }))
        end
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "gR", vim.lsp.buf.references, "Show references")
        map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code actions")
        map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ld", vim.diagnostic.open_float, "Show diagnostics")
        map("n", "[d", function() vim.diagnostic.jump { count = -1, float = true } end, "Prev diagnostic")
        map("n", "]d", function() vim.diagnostic.jump { count = 1, float = true } end, "Next diagnostic")
        map("n", "K", vim.lsp.buf.hover, "Hover docs")
        map("n", "<leader>lR", "<cmd>LspRestart<CR>", "Restart LSP")
      end,
    })
    vim.lsp.config("lua_ls", {
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if
            path ~= vim.fn.stdpath "config"
            and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
          then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
          runtime = {
            -- Tell the language server which version of Lua you're using (most
            -- likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
            -- Tell the language server how to find Lua modules same way as Neovim
            -- (see `:h lua-module-load`)
            path = {
              "lua/?.lua",
              "lua/?/init.lua",
            },
          },
          -- Make the server aware of Neovim runtime files
          workspace = {
            checkThirdParty = false,
            library = {
              vim.env.VIMRUNTIME,
              -- For LSP Settings Type Annotations: https://github.com/neovim/nvim-lspconfig#lsp-settings-type-annotations
              vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
              -- Depending on the usage, you might want to add additional paths
              -- here.
              -- '${3rd}/luv/library',
              -- '${3rd}/busted/library',
            },
            -- Or pull in all of 'runtimepath'.
            -- NOTE: this is a lot slower and will cause issues when working on
            -- your own configuration.
            -- See https://github.com/neovim/nvim-lspconfig/issues/3189
            -- library = vim.api.nvim_get_runtime_file('', true),
          },
        })
      end,
      settings = {
        Lua = {},
      },
    })

    vim.lsp.config("vtsls", vtsls_config)
    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.config("ts_ls", ts_ls_config)
    vim.lsp.enable {
      "eslint",
      "vtsls",
      "vue_ls",
      "lua_ls",
      "emmet_language_server",
      "cssls",
      "html",
      "yamlls",
      "docker_language_server",
      "intelephense",
      "unocss",
      "roslyn_ls",
    }
  end,
}
