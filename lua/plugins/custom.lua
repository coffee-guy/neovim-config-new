return {

  {
    "ggandor/leap.nvim",
    lazy = false,
  },

  --editor
  ----
  {
    -- hight 光标所在词
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure {
        providers = {
          -- 'lsp',
          -- 'treesitter',
          "regex",
        },
      }
      vim.cmd "hi IlluminatedWordText guibg=#393E4D gui=none"
    end,
  },
  -- 快速选择闭合文本
  { "gcmt/wildfire.vim", lazy = false },
  {
    -- good stuff, 快速移动行，类似idea
    "fedepujol/move.nvim",
    lazy = false,
    config = function()
      require("move").setup {}
    end,
  },
  -- {
  --   -- 折叠代码
  --   "kevinhwang91/nvim-ufo",
  --   dependencies = { "kevinhwang91/promise-async" },
  --   config = function()
  --     vim.o.foldcolumn = "1" -- '0' is not bad
  --     vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
  --     vim.o.foldlevelstart = 99
  --     vim.o.foldenable = true
  --
  --     require("ufo").setup()
  --   end,
  -- },
  {
    "gbprod/yanky.nvim",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    -- 快速用寄存器内容替换文本
    "gbprod/substitute.nvim",
    lazy = false,
    config = function()
      local substitute = require "substitute"
      substitute.setup {
        on_substitute = require("yanky.integration").substitute(),
        highlight_substituted_text = {
          enabled = true,
          timer = 200,
        },
      }
    end,
  },
  --make code rain
  {
    "Eandrju/cellular-automaton.nvim",
    keys = "<leader>rr",
    config = function()
      vim.keymap.set("n", "<leader>rr", "<cmd>CellularAutomaton make_it_rain<CR>")
    end,
  },

  {
    "mg979/vim-visual-multi",
    lazy = false,
  },

  {
    -- 自动切换nvim的working directory
    "airblade/vim-rooter",
    lazy = false,
    init = function()
      vim.g.rooter_patterns = { "__vim_project_root", ".git/" }
      vim.g.rooter_silent_chdir = true
      -- set an autocmd
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        callback = function()
          -- source .nvim.lua at project root
          vim.cmd [[silent! source .vim.lua]]
        end,
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    lazy = false,
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "mbbill/undotree",
    lazy = false,
    config = function()
      vim.cmd [[
        noremap L :UndotreeToggle<CR>
        let g:undotree_DiffAutoOpen = 1
        let g:undotree_SetFocusWhenToggle = 1
        let g:undotree_ShortIndicators = 1
        let g:undotree_WindowLayout = 2
        let g:undotree_DiffpanelHeight = 8
        let g:undotree_SplitWidth = 24
        function g:Undotree_CustomMap()
        	nmap <buffer> e <plug>UndotreeNextState
        	nmap <buffer> u <plug>UndotreePreviousState
        	nmap <buffer> E 5<plug>UndotreeNextState
        	nmap <buffer> U 5<plug>UndotreePreviousState
        endfunc]]
    end,
  },

  {
    "gelguy/wilder.nvim",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "configs.wilder"
    end,
  },

  {
    "petertriho/nvim-scrollbar",
    config = function()
      require("scrollbar.handlers.search").setup()
      require("scrollbar").setup()
    end,
  },
  {
    "kevinhwang91/nvim-hlslens",
    config = function()
      require("hlslens").setup()
      local kopts = { noremap = true, silent = true }
      vim.api.nvim_set_keymap(
        "n",
        "=",
        [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap(
        "n",
        "-",
        [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
        kopts
      )
      vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
      vim.api.nvim_set_keymap("n", "<Leader><CR>", "<Cmd>noh<CR>", kopts)
    end,
  },
  {
    "pechorin/any-jump.vim",
    lazy = false,
    config = function()
      vim.keymap.set("n", "e", ":AnyJump<CR>", { noremap = true })
      vim.keymap.set("x", "e", ":AnyJumpVisual<CR>", { noremap = true })
      vim.g.any_jump_preview_lines_count = 5
      vim.g.any_jump_window_width_ratio = 0.9
      vim.g.any_jump_window_height_ratio = 0.9
    end,
  },
  -- notification box in nvim
  {
    "rcarriga/nvim-notify",
    lazy = false,
    config = function()
      local notify = require "notify"
      vim.notify = notify
      notify.setup {
        background_colour = "NotifyBackground",
        fps = 30,
        level = 2,
        minimum_width = 50,
        render = "compact",
        stages = "fade",
        timeout = 5000,
        top_down = true,
      }
    end,
  },
  --python lsp
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = { "python" },
    opts = function()
      return require "configs.null_ls"
    end,
  },
  --python debug
  {
    "rcarriga/nvim-dap-ui",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    -- keys = {
    --   {
    --     "<leader>db",
    --     function()
    --       require("dap").toggle_breakpoint()
    --     end,
    --     mode = { "n" },
    --     desc = "test",
    --   },
    -- },
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      local dap = require("dap").configurations.python

      for _, config in pairs(dap) do
        if type(config) == "table" then
          config.justMyCode = false
        end
      end
    end,
  },
  {
    -- 显示代码的上文，会有堆叠效果，代码长的时候知道这是在哪个函数或者循环中
    "nvim-treesitter/nvim-treesitter-context",
    config = function()
      local tscontext = require "treesitter-context"
      tscontext.setup {
        enable = true,
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit
        min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
        line_numbers = true,
        multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
        trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
        mode = "cursor", -- Line used to calculate context. Choices: 'cursor', 'topline'
        -- Separator between context and content. Should be a single character string, like '-'.
        -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
        separator = nil,
        zindex = 20, -- The Z-index of the context window
        on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
      }
      vim.keymap.set("n", "[c", function()
        tscontext.go_to_context()
      end, { silent = true })
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "v2.*",
    lazy = false,
    config = function()
      require("toggleterm").setup {
        autochdir = true,
        open_mapping = [[<M-q>]],
        direction = "float",
        auto_scroll = true,
        insert_mappings = true,
      }
    end,
  },
  {
    "shellRaining/hlchunk.nvim",
    init = function()
      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, { pattern = "*", command = "EnableHL" })
      require("hlchunk").setup {
        chunk = {
          enable = true,
          use_treesitter = true,
          style = {
            { fg = "#806d9c" },
          },
        },
        indent = {
          chars = { "│", "¦", "┆", "┊" },
          use_treesitter = false,
        },
        blank = {
          enable = false,
        },
        line_num = {
          use_treesitter = true,
        },
      }
    end,
  },
  {
    "stevearc/aerial.nvim",
    lazy = false,
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("aerial").setup {
        layout = {
          -- These control the width of the aerial window.
          -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          -- min_width and max_width can be a list of mixed types.
          -- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
          max_width = { 80, 0.3 },
          width = 60,
          min_width = 20,

          -- key-value pairs of window-local options for aerial window (e.g. winhl)
          win_opts = {},

          -- Determines the default direction to open the aerial window. The 'prefer'
          -- options will open the window in the other direction *if* there is a
          -- different buffer in the way of the preferred direction
          -- Enum: prefer_right, prefer_left, right, left, float
          default_direction = "prefer_right",

          -- Determines where the aerial window will be opened
          --   edge   - open aerial at the far right/left of the editor
          --   window - open aerial to the right/left of the current window
          placement = "window",

          -- When the symbols change, resize the aerial window (within min/max constraints) to fit
          resize_to_content = true,

          -- Preserve window size equality with (:help CTRL-W_=)
          preserve_equality = false,
        },
        keymaps = {
          ["?"] = "actions.show_help",
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.jump",
          ["<2-LeftMouse>"] = "actions.jump",
          ["<C-v>"] = "actions.jump_vsplit",
          ["<C-s>"] = "actions.jump_split",
          ["p"] = "actions.scroll",
          ["<C-j>"] = "actions.down_and_scroll",
          ["<C-k>"] = "actions.up_and_scroll",
          ["{"] = "actions.prev",
          ["}"] = "actions.next",
          ["[["] = "actions.prev_up",
          ["]]"] = "actions.next_up",
          ["q"] = "actions.close",
          ["o"] = "actions.tree_toggle",
          ["za"] = "actions.tree_toggle",
          ["O"] = "actions.tree_toggle_recursive",
          ["zA"] = "actions.tree_toggle_recursive",
          ["l"] = "actions.tree_open",
          ["zo"] = "actions.tree_open",
          ["L"] = "actions.tree_open_recursive",
          ["zO"] = "actions.tree_open_recursive",
          ["h"] = "actions.tree_close",
          ["zc"] = "actions.tree_close",
          ["H"] = "actions.tree_close_recursive",
          ["zC"] = "actions.tree_close_recursive",
          ["zr"] = "actions.tree_increase_fold_level",
          ["zR"] = "actions.tree_open_all",
          ["zm"] = "actions.tree_decrease_fold_level",
          ["zM"] = "actions.tree_close_all",
          ["zx"] = "actions.tree_sync_folds",
          ["zX"] = "actions.tree_sync_folds",
        },
        filter_kind = {
          "Package",
          "Class",
          "Constructor",
          "Enum",
          "Function",
          "Interface",
          "Module",
          "Method",
          "Struct",
        },
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      }
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "T", "<cmd>AerialToggle<CR>")
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    keys = { "<c-g>" },
    config = function()
      vim.g.lazygit_floating_window_scaling_factor = 1.0
      vim.g.lazygit_floating_window_winblend = 0
      vim.g.lazygit_use_neovim_remote = true
      vim.keymap.set("n", "<c-g>", ":LazyGit<CR>", { noremap = true, silent = true })
    end,
  },
}
