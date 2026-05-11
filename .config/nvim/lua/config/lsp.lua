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
  },
}

vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.enable({
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
  "docker-compose-language-service",
  "bashls",
  "jsonls",
})
