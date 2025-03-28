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

--python
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
        autoSearchPaths = false,          -- 禁止自动搜索路径
        diagnosticMode = "openFilesOnly", -- 仅分析打开的文件
        watchPaths = {"**/requirements.txt"}, -- 明确指定监视的文件（按需调整）
      },
    },
  },
}
