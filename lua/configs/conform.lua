-- conform.nvim 配置
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    bash = { "shfmt" },
    sh = { "shfmt" },
    fish = { "fish_indent" },
    go = { "goimports", "gofumpt", "goimports-reviser" },
    javascript = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    vue = { "prettierd", "prettier" },
    css = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    less = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    yaml = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    ["markdown.mdx"] = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },
    handlebars = { "prettierd", "prettier" },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_format = "fallback",
  },
}

require("conform").setup(options)
