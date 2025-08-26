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
  {
    "lewis6991/impatient.nvim",
    config = function() require('impatient') end
  },
  
  { "ellisonleao/gruvbox.nvim" },
  -- {"rebelot/kanagawa.nvim"},
  -- {"neanias/everforest-nvim"},
  -- {"projekt0n/github-nvim-theme"},
  -- {"tiagovla/tokyodark.nvim"},
  {"catppuccin/nvim", 
    config = function()
      vim.cmd("colorscheme catppuccin-frappe")
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
    config = function()
      require("notify").setup({
        on_open = function(win)
          vim.api.nvim_win_set_config(win,{focusable = false})
        end,
      })
    end
  },
  
  {"norcalli/nvim-colorizer.lua", opts = {}},
  
  {"nvim-tree/nvim-web-devicons"},
  
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
  
  { "lewis6991/gitsigns.nvim", opts = {} },
  {"windwp/nvim-autopairs", opts = {}},
  {"numToStr/Comment.nvim", opts = {}},
  
  {
    "folke/todo-comments.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {}
  },
  
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/playground",
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = function() vim.cmd("TSUpdate") end,
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
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-calc",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-cmdline",
    },
    config = function() require("plugins.cmp") end
  },
  
  {
    "onsails/lspkind-nvim",
    config = function()
      require("lspkind").init{
        mode = 'symbol_text',
        preset = 'default',
        
        symbol_map = require("plugins.lspkind-symbol_map")
      }
    end
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
      require("which-key").setup()
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

  { 
     "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {}
  },
  
  {
    "stevearc/conform.nvim",
    config = function() require('plugins.conform') end
  },

  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "arywz11/DAPInstall.nvim",
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function() 
      require("dapui").setup()
      require("plugins.dap") 
    end,
  },
  
  {
    "esmuellert/nvim-eslint",
    opts = {},
  },
  
  {
    'MeanderingProgrammer/render-markdown.nvim',
    after = { 'nvim-treesitter' },
    dependencies = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
    config = function() 
      require('render-markdown').setup({
        latex = {
          enabled = true,
          converter = 'latex2text',
          highlight = 'RenderMarkdownMath',
          top_pad = 0,
          bottom_pad = 0,
        }
      }) 
    end
  }
})
