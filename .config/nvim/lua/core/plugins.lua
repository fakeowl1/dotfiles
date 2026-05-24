local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  { "ellisonleao/gruvbox.nvim", lazy = true },
  -- {"rebelot/kanagawa.nvim"},
  -- {"neanias/everforest-nvim"},
  -- {"projekt0n/github-nvim-theme"},
  -- {"tiagovla/tokyodark.nvim"},
  {"catppuccin/nvim",
    -- config = function()
    --   vim.cmd("colorscheme catppuccin-frappe")
    -- end,
    -- priority = 1000,
    lazy = true
  },

  { 
    'projekt0n/github-nvim-theme',
    config = function()
      vim.cmd('colorscheme github_dark_tritanopia')
    end,
    priority = 1000,
  },
  -- {"gbprod/nord.nvim"},
  -- { "ray-x/aurora" }
  -- {'Everblush/everblush.nvim'}
  -- {"frenzyexists/aquarium-vim"}
  -- {"Mofiqul/vscode.nvim"}

  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      require("notify").setup({
        on_open = function(win)
          vim.api.nvim_win_set_config(win,{focusable = false})
        end,
      })
    end
  },
  
  {
    "catgoose/nvim-colorizer.lua", 
    event = "BufReadPre", 
    opts = {}
  },
  
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = {{"echasnovski/mini.icons", opts = {}}},
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup{
        on_attach = function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- Navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end)

          map('n', '[c', function()
            if vim.wo.diff then
              vim.cmd.normal({'[c', bang = true})
            else
              gitsigns.nav_hunk('prev')
            end
          end)

          -- Actions
          map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'gitsigns: Stage hunk' })
          map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'gitsigns: Reset hunk' })

          map('v', '<leader>hs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = 'gitsigns: Stage selected hunk(s)' })

          map('v', '<leader>hr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
          end, { desc = 'gitsigns: Reset selected hunk(s)' })

          map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'gitsigns: Stage whole buffer' })
          map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'gitsigns: Reset whole buffer' })
          map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'gitsigns: Preview hunk' })
          map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'gitsigns: Preview hunk inline' })

          map('n', '<leader>hb', function()
            gitsigns.blame_line({ full = true })
          end, { desc = 'gitsigns: Blame line (full)' })

          map('n', '<leader>hd', gitsigns.diffthis, { desc = 'gitsigns: Diff against index' })

          map('n', '<leader>hD', function()
            gitsigns.diffthis('~')
          end, { desc = 'gitsigns: Diff against last commit' })

          map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'gitsigns: Send all hunks to quickfix' })
          map('n', '<leader>hq', gitsigns.setqflist, { desc = 'gitsigns: Send buffer hunks to quickfix' })

          -- Toggles
          map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'gitsigns: Toggle current line blame' })
          map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'gitsigns: Toggle word diff' })

          -- Text object
          map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'gitsigns: Select hunk text-object' })
        end
    }
    end
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  {"numToStr/Comment.nvim", opts = {}},
  
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {}
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUPDATE",
    lazy = false,
    config = function() require("plugins.treesitter") end
  },

  
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function() require("plugins.telescope") end
  },
  

  -- Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    dependencies = { 
      {"j-hui/fidget.nvim", tag = "legacy", opts = {}},
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {}
  },
  
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp"
    },
    config = function() require("plugins.cmp") end
  },
  
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init{
        mode = 'symbol_text',
        preset = 'codicons',
        symbol_map = require("plugins.lspkind-symbol_map")
      }
    end,
  },
  
  {
    "sontungexpt/url-open",
    event = "VeryLazy",
    cmd = "URLOpenUnderCursor",
    opts = {},
  }, 

  {
    "folke/which-key.nvim", 
    opts = {}, lazy = true,
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {}
  },
  
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    -- lazy = true,
    -- ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("plugins.obsidian")
    end
  },

  {
    "lervag/vimtex",
    event = "VeryLazy",
    ft = {"tex"},
    init = function()
      vim.g.vimtex_view_general_viewer = 'zathura'
      
      vim.g.vimtex_compiler_latexrun_engines = {
        _ =  'pdflatex'
      }
      vim.g.tex_comment_nospell = 1
    end
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = {"rafamadriz/friendly-snippets"},
    config = function() require("plugins.luasnip") end
  },
  
  { "nvim-tree/nvim-web-devicons", opts = {} },
  
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    config = function()
      require('render-markdown').setup({
        -- Setting render modes like this causes less 'flicker' when changing
        -- between normal, visual and insert modes
        render_modes = { 'n', 'c', 't', 'v', 'V', '\22', 'i' },
        -- Disable signs in the left bar like headings and code snippets
        sign = { enabled = false },
        anti_conceal = {
          ignore = {
            code_background = true,
            head_background = true,
            indent = true,
            sign = true,
            virtual_lines = true,
          },
        },
        heading = {
          icons = {},
        },
        code = {
          border = 'thick',
          -- highlight_border = 'Normal',
          language = false,
        },
        checkbox = {
          unchecked = { icon = '󰄱' },
          checked   = { icon = '' },
        },
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        python = {"black"},
        javascript = {"prettier"},
        golang = {"gofmt"}
      },
    },
  },

  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "arywz11/DAPInstall.nvim",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
    },
    config = function() 
      require("plugins.dap") 
    end,
  },
  
  {
    "esmuellert/nvim-eslint",
    opts = {},
  },
})
