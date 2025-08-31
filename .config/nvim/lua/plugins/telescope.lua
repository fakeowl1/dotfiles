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

keymap("n","<leader>sf",builtin.find_files, {desc = "[S]earch [F]iles"})
keymap("n","<leader>sg",builtin.live_grep, {desc = "[S]earch by [G]rep"})
keymap("n","<leader>sw",builtin.grep_string, {desc = "[S]earch current [W]ord"})
keymap("n","<leader>ff",builtin.current_buffer_fuzzy_find, {desc = "[F]uzzy [F]ind in current [B]uffer"})

keymap("n","<leader>sb",builtin.buffers, {desc = "[F]ind existing [B]uffers"})

keymap("n","<leader>sd",builtin.diagnostics, {desc = "[S]earch [D]iagnostics"})
keymap("n","<leader>sdc",function() builtin.diagnostics{bufnr = 0} end, {desc = "[S]earch [D]iagnostics in current [B]uffer"})
keymap("n","<leader>sk",builtin.keymaps, {desc = "[S]earch existing [K]eymaps"})

keymap('n', '<leader>o', builtin.oldfiles, {desc = "[O]pen old files"})
