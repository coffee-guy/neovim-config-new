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
    "<leader>gs",
    ":Gitsigns toggle_current_line_blame<CR>",
    { noremap = true, silent = true, desc = "Git signs toggle line blame" }
  )
  vim.keymap.set(
    "n",
    "<leader>g=",
    ":Gitsigns next_hunk<CR>",
    { noremap = true, silent = true, desc = "Git signs next hunk" }
  )
  vim.keymap.set(
    "n",
    "<leader>gl",
    ":Gitsigns blame_line<CR>",
    { noremap = true, silent = true, desc = "Git signs blame line" }
  )
  vim.keymap.set(
    "n",
    "<leader>gb",
    ":Gitsigns blame<CR>",
    { noremap = true, silent = true, desc = "Git signs blame entire buffer" }
  )
  vim.keymap.set("n", "<leader>gd", function()
    local gs = package.loaded.gitsigns
    local input = vim.fn.input "Diff target (HEAD~1/@/hash): " -- 弹出输入框
    gs.diffthis(input ~= "" and input or nil) -- 传递参数（空输入则默认比较 HEAD）
  end, { buffer = true })
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
  add = { text = "+" }, -- 新增行
  change = { text = "┃" }, -- 修改行
  delete = { text = "_" }, -- 普通删除行
  topdelete = { text = "‾" }, -- 顶部删除行
  changedelete = { text = "~" }, -- 先修改后删除的行
  untracked = { text = "┆" }, -- 未跟踪文件的行（可选）
}
return opt
