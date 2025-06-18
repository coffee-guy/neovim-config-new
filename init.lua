vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.snipmate_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"
-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- print("test", vim.g.lua_snippets_path)

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- ~/.config/nvim/init.lua

-- 设置剪贴板
vim.opt.clipboard:append "unnamedplus"

-- 自定义剪贴板提供者
if vim.fn.executable "clipboard-provider" == 1 then
  vim.g.clipboard = {
    name = "myClipboard",
    copy = {
      ["+"] = "clipboard-provider copy",
      ["*"] = "clipboard-provider copy",
    },
    paste = {
      ["+"] = "clipboard-provider paste",
      ["*"] = "clipboard-provider paste",
    },
  }
end

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.opt.laststatus = 3
vim.schedule(function()
  require "mappings"
end)
