local ok,nvim_tree = pcall(require,"nvim-tree")
if not ok then
    vim.notify("Failed to load nvim-tree\n\n")
    return
end

nvim_tree.setup({
    sort = {
      sorter = "case_sensitive",
    },
    view = {
      adaptive_size = true,
    },
    filters = {
      dotfiles = true,
    },
})

vim.keymap("n","<C-n>",":NvimTreeToggle<CR>")
