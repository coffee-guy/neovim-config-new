local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local null_ls = require "null-ls"
local opts = {
	sources = {
		-- 移除所有格式化工具（如 black、stylua），仅保留诊断工具
		null_ls.builtins.diagnostics.ruff,       -- Python 静态检查
		null_ls.builtins.diagnostics.mypy.with { -- Python 类型检查
			extra_args = function()
				local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
				return { "--python-executable", virtual .. "/bin/python3" }
			end,
		},
	},
	on_attach = function(client, bufnr)
		-- 移除非格式化相关的逻辑（如自动保存触发格式化）
		-- 注意：这里保留 LSP 格式化支持（如果有其他 LSP 提供格式化，如 pyright）
		if client.supports_method "textDocument/formatting" then
			-- 你可以选择注释以下代码，完全禁用通过 null-ls 的格式化
			vim.api.nvim_clear_autocmds {
				group = augroup,
				buffer = bufnr,
			}
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format { bufnr = bufnr }
				end,
			})
		end
	end,
}

return opts
