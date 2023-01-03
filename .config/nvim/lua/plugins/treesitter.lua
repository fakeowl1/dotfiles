local ok,nvim_treesitter_configs = pcall(require,"nvim-treesitter.configs")
if not ok then
    vim.notify("Failed to load nvim-treesitter\n\n")
    return
end

nvim_treesitter_configs.setup {
    highlight = {
        enable = true,
        disable = {},
    },
    indent = {
        enable = false,
        disable = {},
    },
    
    textobjects = {
        select = {
            enable = true,
            -- Automatically jump forward to textobj, similar to targets.vim 
            lookahead = true,
            keymaps = {
                -- You can use the capture groups defined in textobjects.scm
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner"
            }
        },
        move = {
            enable = true,
            set_jumps = true, 
            goto_next_start = {
                [']m'] = '@function.outer',
                [']]'] = '@class.outer'
            },
            goto_next_end = {
                [']M'] = '@function.outer',
                [']['] = '@class.outer'
            },
            goto_previous_start = {
                ['[m'] = '@function.outer',
                ['[['] = '@class.outer'
            },
            goto_previous_end = {
                ['[M'] = '@function.outer',
                ['[]'] = '@class.outer'
            }
        }
    },

    ensure_installed = {
        "lua",
        "fish",
        "python",
        "go",
        "javascript",
        "css",
        "html",
        "c",
        "cpp"
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
