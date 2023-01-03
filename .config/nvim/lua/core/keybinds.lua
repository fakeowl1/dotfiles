local keymap = vim.keymap.set

-- Block arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   {noremap = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{noremap = true})

keymap("n","<space>,",":nohlsearch<CR>")

-- Telescope --
keymap("n","<leader>ff","<cmd> Telescope find_files <cr>")
keymap("n","<leader>fg","<cmd> Telescope live_grep <cr>")
keymap("n","<leader>fb","<cmd> Telescope buffers   <cr>")

-- NvimTree --
keymap("n","<C-n>",":NvimTreeToggle<CR>")
keymap("n","<leader>n",":NvimTreeFindFile<CR>")
keymap("n","<C-]>","gh defx#do_action('cd',getcwd())<CR>")
