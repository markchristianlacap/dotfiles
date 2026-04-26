--- ESLint LSP (vscode-eslint-language-server)
---
--- Install:
---   npm i -g vscode-langservers-extracted
---
--- Provides :LspEslintFixAll command for fixing on save.

local util = {}

-- Find files containing a specific field (e.g., "eslintConfig" in package.json)
function util.root_markers_with_field(root_files, names, field, fname)
  local path = vim.fn.fnamemodify(fname, ':h')
  local found = vim.fs.find(names, { path = path, upward = true, type = 'file' })

  for _, file_path in ipairs(found or {}) do
    local f = io.open(file_path, 'r')
    if f then
      for line in f:lines() do
        if line:find(field) then
          table.insert(root_files, vim.fs.basename(file_path))
          break
        end
      end
      f:close()
    end
  end

  return root_files
end

function util.insert_package_json(root_files, field, fname)
  return util.root_markers_with_field(
    root_files,
    { 'package.json', 'package.json5' },
    field,
    fname
  )
end

local eslint_config_files = {
  '.eslintrc',
  '.eslintrc.js',
  '.eslintrc.cjs',
  '.eslintrc.yaml',
  '.eslintrc.yml',
  '.eslintrc.json',
  'eslint.config.js',
  'eslint.config.mjs',
  'eslint.config.cjs',
  'eslint.config.ts',
  'eslint.config.mts',
  'eslint.config.cts',
}

---@type vim.lsp.Config
return {
  cmd = function(dispatchers, config)
    local bin = 'vscode-eslint-language-server'

    if config and config.root_dir then
      local local_bin = vim.fs.joinpath(config.root_dir, 'node_modules/.bin', bin)
      if vim.fn.executable(local_bin) == 1 then
        bin = local_bin
      end
    end

    return vim.lsp.rpc.start({ bin, '--stdio' }, dispatchers)
  end,

  filetypes = {
    'javascript', 'javascriptreact',
    'typescript', 'typescriptreact',
    'vue', 'svelte', 'astro', 'htmlangular',
  },

  workspace_required = true,

  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, 'LspEslintFixAll', function()
      client:request_sync('workspace/executeCommand', {
        command = 'eslint.applyAllFixes',
        arguments = {
          {
            uri = vim.uri_from_bufnr(bufnr),
            version = vim.lsp.util.buf_versions[bufnr],
          },
        },
      }, nil, bufnr)
    end, {})
  end,

  root_dir = function(bufnr, on_dir)
    -- Ignore Deno projects
    if vim.fs.root(bufnr, { 'deno.json', 'deno.jsonc', 'deno.lock' }) then
      return
    end

    local root_markers = { 'package-lock.json', 'yarn.lock', 'pnpm-lock.yaml', 'bun.lockb', 'bun.lock' }

    if vim.fn.has('nvim-0.11.3') == 1 then
      root_markers = { root_markers, { '.git' } }
    else
      vim.list_extend(root_markers, { '.git' })
    end

    local project_root = vim.fs.root(bufnr, root_markers) or vim.fn.getcwd()
    local filename = vim.api.nvim_buf_get_name(bufnr)

    local markers = util.insert_package_json(eslint_config_files, 'eslintConfig', filename)

    local has_eslint = vim.fs.find(markers, {
      path = filename,
      type = 'file',
      upward = true,
      limit = 1,
      stop = vim.fs.dirname(project_root),
    })[1]

    if has_eslint then
      on_dir(project_root)
    end
  end,

  settings = {
    validate = 'on',
    packageManager = nil,
    useESLintClass = false,
    experimental = {},

    codeActionOnSave = {
      enable = false,
      mode = 'all',
    },

    format = true,
    quiet = false,
    onIgnoredFiles = 'off',

    run = 'onType',

    problems = {
      shortenToSingleLine = false,
    },

    nodePath = '',
    workingDirectory = { mode = 'auto' },

    codeAction = {
      disableRuleComment = { enable = true, location = 'separateLine' },
      showDocumentation = { enable = true },
    },
  },

  before_init = function(_, config)
    local root = config.root_dir
    if not root then return end

    config.settings = config.settings or {}
    config.settings.workspaceFolder = {
      uri = root,
      name = vim.fn.fnamemodify(root, ':t'),
    }

    -- Yarn PnP support
    if type(config.cmd) == 'table' then
      local has_pnp =
          vim.uv.fs_stat(root .. '/.pnp.cjs') or
          vim.uv.fs_stat(root .. '/.pnp.js')

      if has_pnp then
        config.cmd = vim.list_extend({ 'yarn', 'exec' }, config.cmd)
      end
    end
  end,

  handlers = {
    ['eslint/openDoc'] = function(_, result)
      if result then vim.ui.open(result.url) end
      return {}
    end,

    ['eslint/confirmESLintExecution'] = function(_, result)
      if result then return 4 end -- approved
    end,

    ['eslint/probeFailed'] = function()
      vim.notify('[eslint] probe failed', vim.log.levels.WARN)
      return {}
    end,

    ['eslint/noLibrary'] = function()
      vim.notify('[eslint] library not found', vim.log.levels.WARN)
      return {}
    end,
  },
}
