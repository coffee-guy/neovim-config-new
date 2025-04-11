return {
  {
    "stevearc/conform.nvim",
    lazy = false,
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    lazy = true,
    config = function()
      require("nvim-tree").setup(require "configs.nvim-tree")
    end,
    -- opts = function()
    --   return require "configs.nvim-tree"
    -- end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      local original_on_attach = require("nvchad.configs.lspconfig").on_attach
      -- 然后，创建一个新的 on_attach 函数
      local new_on_attach = function(client, bufnr)
        -- 调用原始的 nvchad on_attach 函数
        original_on_attach(client, bufnr)
        -- 删除原来的 'K' 映射
        -- vim.keymap.del("n", "K", { buffer = bufnr })
        local opts = { buffer = bufnr, noremap = true, nowait = true }

        vim.diagnostic.config {
          float = {
            source = "always",
            border = "rounded",
          },
        }

        vim.keymap.set("n", "<leader>n", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", ":tab sp<CR><cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
        -- vim.keymap.set("i", "<c-f>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>-", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>=", vim.diagnostic.goto_next, opts)
      end
      require("nvchad.configs.lspconfig").on_attach = new_on_attach
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    event = "User FilePost",
    opts = function()
      return require "configs.git"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "debugpy",
        "black",
        "mypy",
        "ruff",
        "lua-language-server",
        "stylua",
        "prettier",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "python",
      },
      highlight = {
        enable = true,
        disable = {}, -- list of language that will be disabled
      },
      indent = {
        enable = false,
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<M-i>",
          node_incremental = "<M-i>",
          node_decremental = "<M-o>",
          scope_incremental = "<M-p>",
        },
      },
    },
  },
  {
    "folke/which-key.nvim",
    keys = {},
    cmd = "WhichKey",
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "whichkey")
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require("which-key").setup(opts)
    end,
  },
}
