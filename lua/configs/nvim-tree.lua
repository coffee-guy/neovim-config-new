local options = {
	filters = {
		dotfiles = true,
		custom = {

			"^.null-ls_*$",
			"^.git$",
		},
	},
	disable_netrw = true,
	hijack_netrw = true,
	hijack_cursor = true,
	hijack_unnamed_buffer_when_opening = false,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_root = false,
	},
	view = {
		adaptive_size = false,
		side = "left",
		width = 30,
		preserve_window_proportions = true,
	},
	git = {
		enable = true,
		ignore = true,
	},
	filesystem_watchers = {
		enable = true,
	},
	actions = {
		open_file = {
			resize_window = false,
		},
	},
	renderer = {
		root_folder_label = false,
		highlight_git = true,
		highlight_opened_files = "none",

		indent_markers = {
			enable = true,
		},

		icons = {
			show = {
				file = true,
				folder = true,
				folder_arrow = true,
				git = true,
			},

			glyphs = {
				default = "󰈚",
				symlink = "",
				folder = {
					default = "",
					empty = "",
					empty_open = "",
					open = "",
					symlink = "",
					symlink_open = "",
					arrow_open = "",
					arrow_closed = "",
				},
				git = {
					unstaged = "✗",
					staged = "✓",
					unmerged = "",
					renamed = "➜",
					untracked = "★",
					deleted = "",
					ignored = "◌",
				},
			},
		},
	},
	on_attach = function(bufnr)
		local api = require "nvim-tree.api"

		local function opts(desc)
			return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
		end

		-- 应用默认的键位映射
		api.config.mappings.default_on_attach(bufnr)

		-- 取消 J 和 K 的默认映射
		vim.keymap.del("n", "J", { buffer = bufnr })
		vim.keymap.del("n", "K", { buffer = bufnr })

		-- 自定义键位映射
		-- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
		vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
	end,
}

return options
