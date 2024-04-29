require "nvchad.mappings"

-- Disable mappings
local nomap = vim.keymap.del

nomap("n", "<leader>lf")
nomap("n", "<C-k>")
nomap("n", "<ESC>")
nomap("n", "<leader>n")
nomap("n", "<leader>rn")
-- add yours here
local map = vim.keymap.set

-- 禁用 'q'
vim.api.nvim_set_keymap('n', 'q', '<Nop>', {noremap = true, silent = true})

-- 将 'Ctrl+m' 映射到录制宏
vim.api.nvim_set_keymap('n', '<M-m>', 'q', {noremap = true, silent = true})

-- Saving and quitting
map("n", "S", ":w<CR>", { desc = "save file" })
map("n", "Q", ":q<CR>", { desc = "quit" })

-- Normal and Visual mode mappings
map({ "n", "v" }, ";", ":", { desc = "Enter command mode" })
map("v", "Y", '"+y', { desc = "Yank to system clipboard" })

-- Toggle character case with ` in Normal and Visual mode
map({ "n", "v" }, "`", "~", { desc = "Toggle case" })

-- Movement
map({ "n", "v" }, "K", "5k", { desc = "Move up 5 lines" })
map({ "n", "v" }, "J", "5j", { desc = "Move down 5 lines" })
-- map({ "n", "v" }, "N", "0", { desc = "Move to start of line" })
-- map({ "n", "v" }, "I", "$", { desc = "Move to end of line" })
map({ "n", "v" }, "W", "5w", { desc = "Move forward 5 words" })
map({ "n", "v" }, "B", "5b", { desc = "Move backward 5 words" })
map({ "n", "v" }, "M", "^", { desc = "Move to first non-blank character of line" })

--move line or block
-- Normal-mode commands
map("n", "<M-d>", ":MoveLine(1)<CR>", { noremap = true, silent = true, desc = "Move line up" })
map("n", "<M-u>", ":MoveLine(-1)<CR>", { noremap = true, silent = true, desc = "Move line down" })

-- -- Visual-mode commands
map("v", "<M-d>", ":MoveBlock(1)<CR>", { noremap = true, silent = true, desc = "Move block up" })
map("v", "<M-u>", ":MoveBlock(-1)<CR>", { noremap = true, silent = true, desc = "Move block down" })

-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- map("n", "zR", require("ufo").openAllFolds, { desc = "Fold open all folds" })
-- map("n", "zM", require("ufo").closeAllFolds, { desc = "Fold close all folds" })

-- Insert mode mappings
map("i", "jj", "<ESC>", { desc = "Mode exit insert mode" })
map("i", "<M-a>", "<ESC>A", { desc = "Edit move to line end" })
map("i", "<M-i>", "<ESC>I", { desc = "Edit move to line start" })

-- Window & splits
map("n", "<leader>w", "<C-w>w", { desc = "Window change to next" })
map("n", "<leader>k", "<C-w>k", { desc = "Window switch up" })
map("n", "<leader>j", "<C-w>j", { desc = "Window switch down" })
map("n", "<leader>h", "<C-w>h", { desc = "Window focus left" })
map("n", "<leader>l", "<C-w>l", { noremap = true, desc = "Window focus right" })
map("n", "qf", "<C-w>o", { desc = "Window maximize current" })
map("n", "s", "<nop>")

-- map("n", "<leader>lf", "<nop>", { desc = "Disable '<leader>lf' key" })
map("n", "sk", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", { desc = "Window create up" })
map("n", "sj", ":set splitbelow<CR>:split<CR>", { desc = "Window create down" })
map("n", "sh", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", { desc = "Window create left" })
map("n", "sl", ":set splitright<CR>:vsplit<CR>", { desc = "Window create right" })
map("n", "<up>", ":res +5<CR>", { desc = "Window size up" })
map("n", "<down>", ":res -5<CR>", { desc = "Window size down" })
map("n", "<left>", ":vertical resize-5<CR>", { desc = "Window size left" })
map("n", "<right>", ":vertical resize+5<CR>", { desc = "Window size right" })

-- Window layout rotation
map("n", "srh", "<C-w>b<C-w>K", { desc = "Window rotate layout horizonal" })
map("n", "srv", "<C-w>b<C-w>H", { desc = "Window rotate layout vertical" })

-- Tab management
map("n", "tu", ":tabe<CR>", { desc = "Tab create new" })
map("n", "tU", ":tab split<CR>", { desc = "Tab create with current buf" })
map("n", "ta", ":-tabnext<CR>", { desc = "Tab switch to left" })
map("n", "tl", ":+tabnext<CR>", { desc = "Tab switch to right" })
map("n", "tma", ":-tabmove<CR>", { desc = "Tab move left" })
map("n", "tml", ":+tabmove<CR>", { desc = "Tab move right" })

-- Miscellaneous
map("n", "<leader>sw", ":set wrap<CR>", { desc = "Toggle wrap" })
map("n", "<leader><CR>", ":nohlsearch<CR>", { desc = "Clear search highlighting" })
map(
  "n",
  "<leader>pr",
  ":profile start profile.log<CR>:profile func *<CR>:profile file *<CR>",
  { desc = "Start profiling" }
)
map("n", "<leader>rc", ":e ~/.config/nvim/init.lua<CR>", { desc = "Edit Neovim config" })
map("n", ",v", "v%", { desc = "select closure nearby" })
map("n", "<leader><esc>", "<nop>", { desc = "Disable '<leader><esc>' key" })

-- Set up Vim Multiple Cursors key mappings using Neovim's Lua API
map("n", "<C-k>", "<Plug>(VM-Find-Under)", { silent = true })
map("x", "<C-k>", "<Plug>(VM-Find-Subword-Under)", { silent = true })
-- Assuming that '' means you want to unmap 'Find Next' and 'Find Prev'
map("n", "<Plug>(VM-Find-Next)", "")
map("n", "<Plug>(VM-Find-Prev)", "")
map("n", "<C-x>", "<Plug>(VM-Remove-Region)", { silent = true })
map("n", "<C-p>", "<Plug>(VM-Skip-Region)", { silent = true })
-- map("n", "<C-r>", "<Plug>(VM-Redo)", { silent = true })
map("n", "<leader>sa", "<Plug>(VM-Select-All)", { silent = true })

--python debug
map(
  "n",
  "<leader>db",
  "<cmd> DapToggleBreakpoint <CR>",
  { silent = true, noremap = true, desc = "Debug toggle breakpoint" }
)
map("n", "<leader>dc", "<cmd> DapContinue <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })
map("n", "<leader>dr", "<cmd> DapToggleRepl <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })
map("n", "<leader>do", "<cmd> DapStepOver <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })
map("n", "<leader>di", "<cmd> DapStepInto <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })
map("n", "<leader>dt", "<cmd> DapStepOut <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })
map("n", "<leader>dl", "<cmd> DapShowLog <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })
map("n", "<leader>dx", "<cmd> DapTerminate <CR>", { silent = true, noremap = true, desc = "Debug toggle breakpoint" })

--edit
map("n", "s", require("substitute").operator, { noremap = true })
map("n", "sh", function()
  require("substitute").operator { motion = "e" }
end, { noremap = true })
map("x", "s", require("substitute.range").visual, { noremap = true })
map("n", "ss", require("substitute").line, { noremap = true })
map("n", "sa", require("substitute").eol, { noremap = true })
map("x", "s", require("substitute").visual, { noremap = true })

--global quick leap
map("n", "<ESC>", function()
  local leap = require "leap"
  vim.api.nvim_set_hl(0, "LeapBackdrop", { link = "Comment" }) -- or some grey
  leap.opts.highlight_unlabeled_phase_one_targets = true
  leap.opts.safe_labels = {}
  leap.opts.labels = { "a", "r", "s", "t", "n", "e", "i", "o", "w", "f", "u", "y", "d", "h" }
  vim.keymap.set("n", "<ESC>", function()
    local current_window = vim.fn.win_getid()
    leap.leap { target_windows = { current_window } }
  end)
end)

local function run_vim_shortcut(shortcut)
  local escaped_shortcut = vim.api.nvim_replace_termcodes(shortcut, true, false, true)
  vim.api.nvim_feedkeys(escaped_shortcut, "n", true)
end

-- close win below
vim.keymap.set("n", "<leader>q", function()
  vim.cmd "TroubleClose"
  local wins = vim.api.nvim_tabpage_list_wins(0)
  if #wins > 1 then
    run_vim_shortcut [[<C-w>j:q<CR>]]
  end
end, { noremap = true, silent = true })
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
