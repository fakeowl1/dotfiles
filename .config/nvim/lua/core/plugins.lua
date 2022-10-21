local ok,packer = pcall(require,"packer")
if not ok then
    vim.notify("Failed to load packer\n\n")
    return
end

vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "*/core/plugins.lua",
    callback = function(arg)
        vim.cmd("source "..arg.file)
        vim.cmd("PackerInstall")
    end,
})

packer.startup{
    function(use)
        use {"wbthomason/packer.nvim"}
        
        use {"nathom/filetype.nvim"}
        
        -- Colorchemes
        use {"catppuccin/nvim",as = "catppuccin"}
        use {"rebelot/kanagawa.nvim"}
        use {"tiagovla/tokyodark.nvim"}
        use {"folke/tokyonight.nvim"}
        use {"navarasu/onedark.nvim"}
        use {"projekt0n/github-nvim-theme"}
        use {"Mofiqul/vscode.nvim"}
        
        use {
            "norcalli/nvim-colorizer.lua",
            config = function() require'colorizer'.setup() end
        }
        use {"dstein64/vim-startuptime"}
        
        use {
            "lukas-reineke/indent-blankline.nvim",
            config = function()
                require("indent_blankline").setup{
                    show_end_of_line = true,
                    space_char_blankline = " ",
                }
            end
        }

        use {
            "windwp/nvim-autopairs",
            config = function() require("nvim-autopairs").setup() end
        }
        
        use {
            "nacro90/numb.nvim",
            config = function() require('numb').setup() end
        }
        
        use {
            "numToStr/Comment.nvim",
            config = function() require('Comment').setup() end
        }
        
        use {
            "lewis6991/gitsigns.nvim",
            config = function()
                require("gitsigns").setup{keymaps = {}}
            end
        } 

        use {
            "folke/todo-comments.nvim",
            requires = "nvim-lua/plenary.nvim",
            config = function() require("todo-comments").setup() end
        }
        
        use {"davidgranstrom/nvim-markdown-preview"}

        use {
            "nvim-telescope/telescope.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = function()
                local actions = require('telescope.actions')
                require('telescope').setup{
                    defaults = {
                        mappings = {
                            n = {
                                ["q"] = actions.close
                            },
                        },
                    }
                }
            end
        }
        
        use {
            "akinsho/toggleterm.nvim", tag = 'v2.*', 
            config = function() require("toggleterm").setup() end
        }

        use {
            "kyazdani42/nvim-tree.lua",
            requires = { "kyazdani42/nvim-web-devicons" },
            config = function() require("plugins.nvim-tree") end
        }
                

        use {
            "rcarriga/nvim-notify",
            config = function()
                local notify = require("notify")
                notify.setup{
                    level = "info",
                    stages = "fade_in_slide_out",

                    on_open = nil,
                    on_close = nil,

                    render = "default",
                    timeout = 5000,

                    max_width = nil,
                    max_height = nil,

                    background_colour = "Normal",

                    minimum_width = 50,

                    icons = vim.g.icons.notify,
                }

            end
        }
        
        -- TODO: write own statusline
        -- use {
        --    "nvim-lualine/lualine.nvim",
        --     requires = { 'kyazdani42/nvim-web-devicons',opt = true},
        --     config = function() require("plugins.lualine") end
        -- }


        use {
            'romgrk/barbar.nvim',
            requires = {'kyazdani42/nvim-web-devicons'},
            config = function() require("plugins.barbar") end,
        }
        
        use {
            'pwntester/octo.nvim',
            requires = {
                'nvim-lua/plenary.nvim',
            },
            config = function() require"octo".setup() end
        }
        
        use { 
            "sindrets/diffview.nvim", 
            requires = 'nvim-lua/plenary.nvim' 
        }

        use {
            "nvim-treesitter/nvim-treesitter",
            requires = {
                "nvim-treesitter/playground",
                "nvim-treesitter/nvim-treesitter-textobjects",
            },
            run = function() vim.cmd("TSUpdate") end,
            config = function() require("plugins.treesitter") end
        }
        
        
        -- Language Server Protocol
        use {
           "neovim/nvim-lspconfig",
           config = function() require("plugins.lsp") end
        }
        
        
        use {
            "j-hui/fidget.nvim",
            config = function() require"fidget".setup() end
        }

        use {
            "hrsh7th/nvim-cmp",
            requires = {
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-buffer",
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-calc",
                "hrsh7th/cmp-emoji",
                "hrsh7th/cmp-cmdline",
            },
            config = function() require("plugins.cmp") end
        }
        
        use {
            "onsails/lspkind-nvim",
            config = function()
                local lspkind = require("lspkind")
                lspkind.init{
                    mode = 'symbol_text',
                    preset = 'codicons',

                    symbol_map = vim.g.icons.kind
                }
            end
        }
        
        use {
            "L3MON4D3/LuaSnip",
            requires = {
                "rafamadriz/friendly-snippets",
            },
            config = function()
                require("luasnip/loaders/from_vscode").lazy_load()
            end
        }
        

        use {
            "ray-x/lsp_signature.nvim",
            config = function()
                local lsp_signature = require("lsp_signature")
                
                lsp_signature.setup{
                    hint_enable = false,
                    verbose = true
                }

            end
        }

        use {
	        "SmiteshP/nvim-gps",
	        requires = "nvim-treesitter/nvim-treesitter",
            config = function() require("nvim-gps").setup() end,
        }
        


        use {
            "jose-elias-alvarez/null-ls.nvim",
            config = function() require("plugins.null-ls") end
        }

        -- Debug Adapter Protocol
        use {
            "mfussenegger/nvim-dap",
            requires = {
                "arywz11/DAPInstall.nvim",
                "rcarriga/nvim-dap-ui"
            },
            config = function() require("plugins.dap") end,
        }

    end,
     
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float{border = "rounded"}
            end
        }
    }
}

local function bootstrap()
    local fn = vim.fn
    local packer_install_path =
    fn.stdpath("data").."/site/pack/packer/opt/packer.nvim"
    local not_installed = fn.empty(fn.glob(packer_install_path)) == 1

    if not_installed then
        print("`packer.nvim` is not installed, installing...")
        local repo = "https://github.com/wbthomason/packer.nvim"
        vim.cmd(("!git clone %s %s"):format(repo, packer_install_path))
    end

    vim.cmd("packadd packer.nvim")
    require("packer").startup {
        load,
        config = {
            git = {clone_timeout = 240},
        },
    }
    
    if not_installed then
        vim.cmd("PackerSync")
    end
end

return bootstrap
