local ok,nvim_tree = pcall(require,"nvim-tree")
if not ok then
    vim.notify("Failed to load nvim-tree\n\n")
    return
end

local keymap = vim.keymap.set

nvim_tree.setup({
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {{ key = "u", action = "dir_up" }},
        },
    },

    filters = {
        dotfiles = true,
    },
})

keymap("n","<C-n>",":NvimTreeToggle<CR>")
keymap("n","<leader>n",":NvimTreeFindFile<CR>")
keymap("n","<C-]>","gh defx#do_action('cd',getcwd())<CR>")
