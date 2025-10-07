local M = {}

local format_by_ft = {
  vue = { "eslint" },
  javascript = { "eslint" },
  typescript = { "eslint" },
  cs = { "roslyn", "null-ls" },
}

function M.on_save()
  local ft = vim.bo.filetype
  local formatters = format_by_ft[ft]
  if formatters and #formatters > 0 then
    for _, name in ipairs(formatters) do
      pcall(vim.lsp.buf.format, { name = name })
    end
  else
    pcall(vim.lsp.buf.format)
  end
end

return M
