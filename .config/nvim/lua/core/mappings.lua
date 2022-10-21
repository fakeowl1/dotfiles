local keymap = vim.keymap.set


vim.g.mapleader = " "

keymap("n","<space>,",":nohlsearch<CR>")
keymap("n","<leader>m",":MarkdownPreview<CR>")

-- Block arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   {noremap = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{noremap = true})

-- resize
keymap("n","<C-k>",":resize -2<CR>")
keymap("n","<C-j>",":resize 2<CR>")
keymap("n","<C-h>",":vertical resize -2<CR>")
keymap("n","<C-l>",":vertical resize 2<CR>")

-- tabs
keymap("n","<leader>tn",":tabnew <CR>")
keymap("n","<leader>tc",":tabclose<CR>")


-- NvimTree --
keymap("n","<C-n>",":NvimTreeToggle<CR>")
keymap("n","<leader>n",":NvimTreeFindFile<CR>")
keymap("n","<C-]>","gh defx#do_action('cd',getcwd())<CR>")

-- Telescope --
keymap("n","<leader>ff","<cmd> Telescope find_files <cr>")
keymap("n","<leader>fg","<cmd> Telescope live_grep <cr>")
keymap("n","<leader>fb","<cmd> Telescope buffers   <cr>")
keymap("n","<leader>fh","<cmd> Telescope help_tags <cr>")

-- barbar.nvim
keymap('n', '<A-,>', ':BufferPrevious<CR>')
keymap('n', '<A-.>', ':BufferNext<CR>')

-- Re-order to previous/next
keymap('n', '<A-<>', ':BufferMovePrevious<CR>')
keymap('n', '<A->>', ' :BufferMoveNext<CR>')

-- Goto buffer in position...
keymap('n', '<A-1>', ':BufferGoto 1<CR>')
keymap('n', '<A-2>', ':BufferGoto 2<CR>')
keymap('n', '<A-3>', ':BufferGoto 3<CR>')
keymap('n', '<A-4>', ':BufferGoto 4<CR>')
keymap('n', '<A-5>', ':BufferGoto 5<CR>')
keymap('n', '<A-6>', ':BufferGoto 6<CR>')
keymap('n', '<A-7>', ':BufferGoto 7<CR>')
keymap('n', '<A-8>', ':BufferGoto 8<CR>')
keymap('n', '<A-9>', ':BufferGoto 9<CR>')
keymap('n', '<A-0>', ':BufferLast<CR>')

-- Close buffer
keymap('n', '<A-c>', ':BufferClose<CR>')
