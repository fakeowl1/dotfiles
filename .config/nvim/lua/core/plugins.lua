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
  
  {
    "neanias/everforest-nvim",
    config = function()
      vim.cmd.colorscheme "everforest"
      require("everforest").setup()
    end
  },
  
  -- { "gbprod/nord.nvim" }
  { "rebelot/kanagawa.nvim" }, 
  -- { "ellisonleao/gruvbox.nvim" }
  -- { "ray-x/aurora" }
  {"catppuccin/nvim"},
  -- {"tiagovla/tokyodark.nvim"}
  -- {'Everblush/everblush.nvim'}
  -- {"frenzyexists/aquarium-vim"}
  -- {"projekt0n/github-nvim-theme"}
  -- {"Mofiqul/vscode.nvim"}
  
  {
    "kyazdani42/nvim-tree.lua",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    config = function() require("plugins.nvim-tree") end
  },
  
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
  
  {
    "norcalli/nvim-colorizer.lua",
    opts = {},
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    }
  },

  { "windwp/nvim-autopairs", opts = {} },
  
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   main = "ibl",
  --   opts = {
  --     -- indent = { highlight = {"CursorColumn", "Whitespace"}},
  --     -- whitespace = {
  --     --     highlight = highlight,
  --     --     remove_blankline_trail = false,
  --     -- },
  --     -- scope = { enabled = false },
  --   }
  -- },
  
  {
    "numToStr/Comment.nvim",
    opts = {}
  },
  
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
      {"williamboman/mason.nvim", opts}, 
      "williamboman/mason-lspconfig.nvim",
      {"j-hui/fidget.nvim", 
        tag = "legacy",
        opts = {}
      }
    },
    config = function()
      require("lsp") 
      require("mason").setup()
    end
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
        preset = 'codicons',
        
        symbol_map = {
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      }
    end
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
    "L3MON4D3/LuaSnip",
    dependencies = {"rafamadriz/friendly-snippets"},
    config = function() require("plugins.luasnip") end
  },
  
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function() require("plugins.null-ls") end
  },
  
  {
    "SmiteshP/nvim-navic",
    dependencies = {"neovim/nvim-lspconfig"},
    config = function()
      local navic = require("nvim-navic")
      navic.setup {
        highlight = false,
        separator = " > ",
        depth_limit = 0.01,
        depth_limit_indicator = "..",
        safe_output = true
      }
    end,
  },
  
  -- Debug Adapter Protocol
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "arywz11/DAPInstall.nvim",
      "rcarriga/nvim-dap-ui"
    },
    config = function() require("plugins.dap") end,
  }
})
