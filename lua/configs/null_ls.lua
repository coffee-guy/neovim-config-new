local null_ls = require "null-ls"
local opts = {
  sources = {
    -- 移除所有格式化工具（如 black、stylua），仅保留诊断工具
    -- null_ls.builtins.diagnostics.ruff,       -- Python 静态检查
    null_ls.builtins.formatting.black,
    -- null_ls.builtins.formatting.pyink,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier.with {
      filetypes = { "json" }, -- 指定 prettier 只处理 JSON 文件
    },
    -- null_ls.builtins.diagnostics.actionlint,

    --mypy 主要是类型检查
    -- null_ls.builtins.diagnostics.mypy.with { -- Python 类型检查
    -- 	extra_args = function()
    -- 		local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX" or "/usr"
    -- 		return { "--python-executable", virtual .. "/bin/python3" }
    -- 	end,
    -- },
  },
}

return opts
