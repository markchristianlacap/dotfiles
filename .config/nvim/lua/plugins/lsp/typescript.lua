local vue_language_server_path = vim.fn.stdpath("data")
    .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"

local vue_plugin = {
  name = "@vue/typescript-plugin",
  location = vue_language_server_path,
  languages = { "vue" },
  configNamespace = "typescript",
}

vim.lsp.config("vtsls", {
  on_attach = function(client)
    local existing_capabilities = client.server_capabilities
    if vim.bo.filetype == "vue" then
      existing_capabilities.semanticTokensProvider.full = false
    else
      existing_capabilities.semanticTokensProvider.full = true
    end
  end,
  filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
  settings = {
    vtsls = {
      tsserver = {
        globalPlugins = { vue_plugin },
      },
    },
  },
})

vim.lsp.config("vue_ls", {
  settings = {
    vue = {
      suggest = {
        componentNameCasing = "preferKebabCase",
        propNameCasing = "preferKebabCase",
      },
    },
  },
})
