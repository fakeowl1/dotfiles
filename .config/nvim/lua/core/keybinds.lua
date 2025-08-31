-- local keymap = vim.keymap.set

-- Block arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   {noremap = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{noremap = true})

vim.keymap.set("n","<space>,",":nohlsearch<CR>", {desc = "Clear an selected strings"})

vim.keymap.set('n', '<C-n>', [[<Cmd>NvimTreeToggle<CR>]], {desc = "[O]pen Nvim tree"})

vim.keymap.set('n', 'gwk', [[<Cmd>wincmd k<CR>]], {desc = "[S]elect up window"})
vim.keymap.set('n', 'gwj', [[<Cmd>wincmd j<CR>]], {desc = "[S]elect bottom window"})
vim.keymap.set('n', 'gwl', [[<Cmd>wincmd l<CR>]], {desc = "[S]elect right window"})
vim.keymap.set('n', 'gwh', [[<Cmd>wincmd h<CR>]], {desc = "[S]elect left window"})

vim.keymap.set("n", "<space>bf", ":bfirst<CR>",{desc = "[G]oto first buffer"})
vim.keymap.set("n", "<space>bl", ":blast<CR>", {desc = "[G]oto last buffer"})
vim.keymap.set("n", "<space>bn", ":bnext<CR>", {desc = "[G]oto next buffer"})

vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>")

vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
