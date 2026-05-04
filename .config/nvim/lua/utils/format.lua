local M = {}

local format_by_ft = {
  vue = { "none-ls", "eslint" },
  json = { "none-ls" },
  html = { "none-ls" },
  javascript = { "none-ls", "eslint" },
  typescript = { "none-ls", "eslint" },
  cs = { "none-ls" },
}

function M.format()
  local ft = vim.bo.filetype
  local allowed = format_by_ft[ft]

  vim.lsp.buf.format({
    async = false,
    filter = function(client)
      -- if no specific config, allow all
      if not allowed then
        return true
      end

      -- match allowed clients
      return vim.tbl_contains(allowed, client.name)
    end,
  })
end

return M
