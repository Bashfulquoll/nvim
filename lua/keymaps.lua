-- [[ BASIC KEYMAPS ]]
-- Can get some help here with ':help vim.keymap.set()'

-- Clear highlights on search when pressting <Esc> in normal mode
-- See ':help hlsearch'
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic Config & Keymaps
-- See :help vim.diagnostic.Opts
vim.diagnostic.config {
  update_in_insert = false, -- Stops updating warnings and errors while typing.
  severity_sort = true, -- Sorts severities, Error -> Warning -> Info.
  float = { border = 'rounded', source = 'if_many' }, 
  -- Sets floating window borders to rounded. if_many source = will only show the source file if there are multiple sources, if there is only one source, it won't show the file name.
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  -- The above line only sets underlining of diagonostics to happen for severities above warning (will only show underlines for Warnings and Errors).
  -- Can switch between these as you prefer
  virtual_text = true, -- Text shows up at the end of the line
  virtual_lines = false, -- Text shows up underneath the line, with virtual lines

  -- Auto open the float, so you can easily read the errors when jumping with `[d` and `]d`
  jump = { float = true },
}

-- Binds the 'q' ley to open diagnostics into the location list.
-- This lets you jump to reported issues using the 'q' key basically.
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc 
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- keybinds to make split navigation easier.
-- use ctrl+<hjkl> to switch between windows (ctrl+w or s for horizontal split.
-- ctrl+wv for vertical split)
--
--  see `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<c-h>', '<c-w><c-h>', { desc = 'move focus to the left window' })
vim.keymap.set('n', '<c-l>', '<c-w><c-l>', { desc = 'move focus to the right window' })
vim.keymap.set('n', '<c-j>', '<c-w><c-j>', { desc = 'move focus to the lower window' })
vim.keymap.set('n', '<c-k>', '<c-w><c-k>', { desc = 'move focus to the upper window' })

-- Highlights text when the text is yanked (copied to clipboard)
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})
