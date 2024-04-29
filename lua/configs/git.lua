local opt = {}
opt.on_attach = function(bufnr)
  vim.keymap.set(
    "n",
    "<leader>g-",
    ":Gitsigns prev_hunk<CR>",
    { noremap = true, silent = true, desc = "Git signs pre hunk" }
  )
  vim.keymap.set(
    "n",
    "<leader>g=",
    ":Gitsigns next_hunk<CR>",
    { noremap = true, silent = true, desc = "Git signs next hunk" }
  )
  vim.keymap.set(
    "n",
    "<leader>gb",
    ":Gitsigns blame_line<CR>",
    { noremap = true, silent = true, desc = "Git signs blame hunks" }
  )
  vim.keymap.set(
    "n",
    "<leader>gr",
    ":Gitsigns reset_hunk<CR>",
    { noremap = true, silent = true, desc = "Git signs reset hunk" }
  )
  vim.keymap.set(
    "n",
    "H",
    ":Gitsigns preview_hunk_inline<CR>",
    { noremap = true, silent = true, desc = "Git signs preview hunk inline" }
  )
end
opt.signs = {
    add          = { text = '┃' },
    change       = { text = '┃' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  }
return opt
