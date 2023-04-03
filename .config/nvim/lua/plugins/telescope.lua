local ok, telescope = pcall(require, "telescope")
if not ok then
  vim.notify("Failed to load telescope")
  return
end

local actions = require'telescope.actions'
local builtin = require'telescope.builtin'

telescope.setup{
  defaults = {
    mappings = {
      i = {
        ["<c-j>"] = actions.move_selection_next,
        ["<c-k>"] = actions.move_selection_previous,
      },
      n = {
        ["q"] = actions.close,
      }
    },
  }
}

local keymap = vim.keymap.set

keymap("n","<leader>f",builtin.find_files)
keymap("n","<leader>l",builtin.live_grep)
keymap("n","<leader>L",builtin.grep_string)

keymap("n","<leader>;",builtin.current_buffer_fuzzy_find)
keymap("n","<leader>b",builtin.buffers)

keymap("n","<leader>e",function()
  builtin.diagnostics{bufnr = 0,severity_limit = "WARN"}
end)

keymap("n","<leader>E",function()
  builtin.diagnostics{severity_limit = "WARN"}
end)
