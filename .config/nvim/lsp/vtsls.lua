-- Vue plugin path
local vue_language_server_path = vim.fn.expand "$MASON/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}
return {
  cmd = { "vtsls", "--stdio" },
  inits_options = { hostInfo = "neovim" },
  filetypes = {
    "typescript",
    "javascript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
  on_attach = function(client)
    local existing_capabilities = client.server_capabilities
    if vim.bo.filetype == 'vue' then
      existing_capabilities.semanticTokensProvider.full = false
    else
      existing_capabilities.semanticTokensProvider.full = true
    end
  end,
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = { vue_plugin },
      },
    },
  },
}
