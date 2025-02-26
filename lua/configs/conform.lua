-- conform.nvim 配置
local options = {
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "black" }, -- 明确添加 Python 格式化
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
}
require("conform").setup(options)
