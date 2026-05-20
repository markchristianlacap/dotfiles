local M = {}

local format_by_ft = {
  vue = { "null-ls" },
  json = { "null-ls" },
  html = { "null-ls" },
  javascript = { "null-ls" },
  typescript = { "null-ls" },
  cs = { "null-ls" },
}

function M.format()
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
