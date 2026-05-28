-- Block arrows
vim.api.nvim_set_keymap('', '<up>', '<nop>',   {noremap = true})
vim.api.nvim_set_keymap('', '<down>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<left>', '<nop>', {noremap = true})
vim.api.nvim_set_keymap('', '<right>', '<nop>',{noremap = true})

vim.keymap.set("n", "<space>,", ":nohlsearch<CR>", {desc = "Clear selected search highlights"})

-- Windows navigation
vim.keymap.set('n', 'gwk', "<cmd>wincmd k<CR>", {desc = "Go to window above"})
vim.keymap.set('n', 'gwj', "<cmd>wincmd j<CR>", {desc = "Go to window below"})
vim.keymap.set('n', 'gwl', "<cmd>wincmd l<CR>", {desc = "Go to window on the right"})
vim.keymap.set('n', 'gwh', "<cmd>wincmd h<CR>", {desc = "Go to window on the left"})

-- Windows resize
vim.keymap.set("n", "<leader>h", ":vertical resize +20<cr>", {desc = "Resize window wider"})
vim.keymap.set("n", "<leader>l", ":vertical resize -20<cr>", {desc = "Resize window narrower"})
vim.keymap.set("n", "<leader>k", ":resize +10<cr>", {desc = "Resize window taller"})
vim.keymap.set("n", "<leader>j", ":resize -10<cr>", {desc = "Resize window shorter"})

-- Buffers
vim.keymap.set("n", "<leader>n", ":bn<CR>", {desc = "Next buffer"})
vim.keymap.set("n", "<leader>p", ":bp<CR>", {desc = "Previous buffer"})
vim.keymap.set("n", "<leader>x", ":bd<CR>", {desc = "Delete current buffer"})

vim.keymap.set("n", "<leader>bf", ":bf<CR>", {desc = "[G]oto first buffer"})
vim.keymap.set("n", "<leader>bd", ":bl<CR>", {desc = "[G]oto last buffer"})

vim.keymap.set("n", "gx", "<esc>:URLOpenUnderCursor<cr>", {desc = "Open URL under cursor"})

-- Delete without yanking 
vim.keymap.set({"n", "v"}, "<leader>d", '"_d', {desc = "Delete selection without yanking"})
vim.keymap.set({"n", "v"}, "<leader>D", '"_dd', {desc = "Delete line without yanking"})

-- Obsidian keybinds
vim.keymap.set("n", "<leader>on", function()
    vim.cmd("ObsidianTemplate note")
    
    vim.cmd([[1,/^\S/s/^\n\+//e]])
end, { desc = "Obsidian: Convert note to template" })

vim.keymap.set("n", "<leader>of", function()
    vim.cmd([[s/\(# \)[^_]*_/\1/e]])
    
    vim.cmd([[s/-/ /ge]])
end, { desc = "Obsidian: Clean " })

local obsidian_path = vim.fn.expand("~/Notes")

vim.keymap.set("n", "<leader>os", function()
    require("telescope.builtin").find_files({
        search_dirs = { obsidian_path },
        prompt_title = "Obsidian Notes",
    })
end, { desc = "Obsidian: Find notes" })

vim.keymap.set("n", "<leader>oz", function()
    require("telescope.builtin").live_grep({
        search_dirs = { obsidian_path },
        prompt_title = "Obsidian Live Grep",
    })
end, { desc = "Obsidian: Live grep note text" })

vim.keymap.set("n", "<leader>odd", function()
  local current_file = vim.api.nvim_buf_get_name(0)

  if current_file == "" then
    vim.notify("Cannot delete an unsaved buffer!", vim.log.levels.WARN)
    return
  end

  local file_name = vim.fs.basename(current_file)

  local confirm = vim.fn.confirm("Permanently delete " .. file_name .. "?", "&Yes\n&No", "Y")

  if confirm == 1 then
    local success, err = vim.uv.fs_unlink(current_file)
    
    if success then
      vim.cmd("bdelete")
      vim.notify("File successfully deleted", vim.log.levels.INFO)
    else
      vim.notify("Error deleting file: " .. tostring(err), vim.log.levels.ERROR)
    end
  else
    vim.notify("Deletion cancelled", vim.log.levels.INFO)
  end
end, { desc = "Obsidian: Delete current note" })
