local vue_path = vim.fn.expand("$MASON/packages") .. "/vue-language-server" .. "/node_modules/@vue/language-server"
local file_types = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_path,
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
  filetypes = file_types,
}
local vue_ls_config = {
  settings = {
    vue = {
      suggest = {
        componentNameCasing = "preferKebabCase",
        propNameCasing = "preferKebabCase",
      },
    },
  }
}
local lua_ls_config = {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
          path ~= vim.fn.stdpath("config")
          and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          vim.api.nvim_get_runtime_file("lua/lspconfig", false)[1],
        },
      },
    })
  end,
  settings = {
    Lua = {},
  },
}
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("lua_ls", lua_ls_config)
vim.lsp.enable({
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
  -- "roslyn_ls",
  "docker-compose-language-service",
  "bashls",
  "jsonls"
})
