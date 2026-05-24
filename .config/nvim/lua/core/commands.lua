vim.api.nvim_create_user_command("PackUpdate", function(opts)
  -- checks if any argument is passed
  if opts.args:match("%S") then
    -- update specific plugins
    local plugins = vim.split(opts.args, "%s+", { trimempty = true })
    -- update only specified plugins
    vim.pack.update(plugins)
  else
    -- update all
    vim.pack.update()
  end
end, { nargs = "*", desc = "Update all plugins or specific ones" })
