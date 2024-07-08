local keymap = vim.keymap.set

-- Block arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   {noremap = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{noremap = true})

keymap("n","<space>,",":nohlsearch<CR>", {desc = "Clear an selected strings"})

keymap("n","s",'"_d"')

keymap('n', 'gwh', '<C-w>h')
keymap('n', 'gwj', '<C-w>j')
keymap('n', 'gwk', '<C-w>k')
keymap('n', 'gwl', '<C-w>l')

keymap("n", "<space>bf", ":bfirst<CR>",{desc = "[G]oto first buffer"})
keymap("n", "<space>bl", ":blast<CR>", {desc = "[G]oto last buffer"})
keymap("n", "<space>bn", ":bnext<CR>", {desc = "[G]oto next buffer"})

vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
