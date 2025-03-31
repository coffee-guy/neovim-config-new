-- conform.nvim 配置
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
