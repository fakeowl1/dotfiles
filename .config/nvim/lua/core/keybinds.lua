local keymap = vim.keymap.set

-- Block arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   {noremap = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{noremap = true})

keymap("n","<space>,",":nohlsearch<CR>")

keymap("n","s",'"_d"')

keymap('n', 'gwh', '<C-w>h')
keymap('n', 'gwj', '<C-w>j')
keymap('n', 'gwk', '<C-w>k')
keymap('n', 'gwl', '<C-w>l')
