return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  cmd = 'Neotree',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  config = function(_, opts)
    opts.event_handlers = opts.event_handlers or {}
    require('neo-tree').setup(opts)
    vim.api.nvim_create_autocmd('TermClose', {
      pattern = '*lazygit',
      callback = function()
        if package.loaded['neo-tree.sources.git_status'] then
          require('neo-tree.sources.git_status').refresh()
        end
      end,
    })
  end,
  opts = {
    sources = { 'filesystem', "buffers", "git_status", "document_symbols" },
    open_files_do_not_replace_types = { 'terminal', "Trouble", "qf", "Outline" },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
    },
    window = {
      mappings = {
        ['<space>'] = "none",
      },
    },
    default_component_configs = {
      indent = {
        with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = '',
        expander_expanded = '',
        expander_highlight = 'NeoTreeExpander',
      },
    },
  },
  init = function()
    if vim.fn.argc() == 1 then
      local stat = vim.loop.fs_stat(vim.fn.argv(0))
      if stat and stat.type == 'directory' then
        require('neo-tree')
      end
    end
  end,
  deactivate = function()
    vim.cmd([[Neotree close]])
  end,
  keys = {
    {
      '<leader>fe',
      function()
        require('neo-tree.command').execute({ toggle = true })
      end,
      desc = 'Explorer NeoTree (root dir)',
    },
    {
      '<leader>fE',
      function()
        require('neo-tree.command').execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = 'Explorer NeoTree (cwd)',
    },
    { '<leader>e', "<leader>fe", desc = "Explorer NeoTree (root dir)", remap = true },
    { '<leader>E', "<leader>fE", desc = "Explorer NeoTree (cwd)",      remap = true },
  },
}
