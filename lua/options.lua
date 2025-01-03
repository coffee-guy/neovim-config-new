require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt = 'both' -- to enable cursorline!
--
vim.o.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

vim.o.ttyfast = true
vim.o.autochdir = true
vim.o.exrc = true
vim.o.secure = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.expandtab = false
vim.o.tabstop = 2
vim.o.smarttab = true
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.autoindent = true
vim.o.list = true
vim.o.listchars = 'tab:>-,trail:-'
vim.o.scrolloff = 4
vim.o.ttimeoutlen = 0
vim.o.timeout = false
vim.o.viewoptions = 'cursor,folds,slash,unix'
vim.o.wrap = true
vim.o.textwidth = 0
vim.o.indentexpr = ''
vim.o.foldmethod = 'indent'
vim.o.foldlevel = 99
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.formatoptions = vim.o.formatoptions:gsub('tc', '')
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.showmode = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.inccommand = 'split'
vim.o.completeopt = 'longest,noinsert,menuone,noselect,preview'
vim.o.completeopt = 'menuone,noinsert,noselect,preview'
-- vim.o.lazyredraw = true
vim.o.visualbell = true
vim.o.colorcolumn = '100'
vim.o.updatetime = 100
vim.o.virtualedit = 'block'


vim.cmd([[
silent !mkdir -p $HOME/.config/nvim/tmp/backup
silent !mkdir -p $HOME/.config/nvim/tmp/undo
"silent !mkdir -p $HOME/.config/nvim/tmp/sessions
set backupdir=$HOME/.config/nvim/tmp/backup,.
set directory=$HOME/.config/nvim/tmp/backup,.
if has('persistent_undo')
	set undofile
	set undodir=$HOME/.config/nvim/tmp/undo,.
endif
]])

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell", })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h", })

vim.cmd([[au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]])

vim.g.any_jump_disable_default_keybindings = 1

local config_path = vim.fn.stdpath("config")
local current_config_path = config_path .. "/lua/configs/machine_specific.lua"
if not vim.loop.fs_stat(current_config_path) then
	local current_config_file = io.open(current_config_path, "wb")
	local default_config_path = config_path .. "/default_config/_machine_specific_default.lua"
	local default_config_file = io.open(default_config_path, "rb")
	if default_config_file and current_config_file then
		local content = default_config_file:read("*all")
		current_config_file:write(content)
		io.close(default_config_file)
		io.close(current_config_file)
	end
end
require("configs.machine_specific")
