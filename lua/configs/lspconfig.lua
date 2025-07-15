-- EXAMPLE
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = { "html", "cssls" }

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.ts_ls.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

-- 启动快，补全和跳转精准，支持 Hover。
-- 适合大多数 Python 开发场景。
-- require("lspconfig").jedi_language_server.setup {
--   init_options = {
--     -- 禁用不需要的功能
--     diagnostics = { enable = false }, -- 关闭诊断
--     codeAction = { enable = false }, -- 关闭代码修复
--     -- 仅启用你需要的功能
--     completion = { enable = true },
--     hover = { enable = true },
--     definition = { enable = true },
--   },
--   -- 优化性能
--   flags = {
--     debounce_text_changes = 300, -- 减少触发频率
--   },
-- }
--
--pylsp
--比 Pyright 快，功能完整，但比 Jedi 稍慢。
-- require("lspconfig").pylsp.setup {
--   settings = {
--     pylsp = {
--       plugins = {
--         -- 禁用所有不需要的插件
--         pyflakes = { enabled = false },
--         pylint = { enabled = false },
--         pycodestyle = { enabled = false },
--         -- 只启用 Jedi 补全和跳转
--         jedi = {
--           extra_paths = {},
--           environment = nil,
--           auto_import_modules = {},
--         },
--       },
--     },
--   },
--   -- 优化性能
--   flags = {
--     debounce_text_changes = 300,
--   },
-- }

--ruff-lsp
--最快，没有hover
-- require("lspconfig").ruff.setup {
--   -- 只启用补全和跳转
--   capabilities = {
--     textDocument = {
--       completion = { dynamicRegistration = true },
--       definition = { dynamicRegistration = true },
--       -- hover 不支持，需禁用
--       hover = { dynamicRegistration = false },
--     },
--   },
--   -- 禁用所有额外功能
--   init_options = {
--     settings = {
--       lint = { enable = false }, -- 关闭检查
--       format = { enable = false }, -- 关闭格式化
--     },
--   },
-- }
--
--python
--pyright 最慢，不过效果最好
lspconfig.pyright.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticSeverityOverrides = {
          reportOptionalMemberAccess = "warning",
          reportArgumentType = false,
          reportOptionalSubscript = "warning",
        },
        -- 关闭不必要的文件监视
        autoSearchPaths = false, -- 禁止自动搜索路径
        -- diagnosticMode = "openFilesOnly", -- 仅分析打开的文件
        diagnosticMode = "workspaceIncremental", -- 仅分析打开的文件
        watchPaths = { "**/requirements.txt" }, -- 明确指定监视的文件（按需调整）
      },
    },
  },
}
-- lspconfig.ruff.setup {
--   on_attach = on_attach,
--   on_init = on_init,
--   capabilities = capabilities,
--   filetypes = { "python" },
-- }
