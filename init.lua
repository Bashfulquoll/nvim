-- My Neovim Config:
-- Using Kickstart.nvim as a base to learn how to setup my own config line by line.
-- This is effectively sequentially transcribed for things I want from Kickstart.nvim: github.com/nvim-lua/kickstart.nvim/
--
--
-- Set <space> as the leader key
-- This means you hit space to then typing a command instead of the default '\'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set line numbers to be switched on:
vim.o.number = true

-- Set the 'mode' to not show, as it is in the status line. 
-- The 'mode' in this case is like '-- INSERT --' being shown in the bottom panel.
vim.o.showmode = false

-- Allows the use of the clipboard between OS and Neovim. 
-- This needs to be scheduled after 'uiEnter' otherwise it can increase startup-time.
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)

-- BreakIndent causes text to wrap onto the next line, the wrapped part will keep the same indentation as the original original line.
vim.o.breakindent = true

-- Enable undo/redo changes even after reopening a closed file.
vim.o.undofile = true

-- Enables case insensitive searching unless \C is present, or one or more capital letters are present in the search time
vim.o.ignorecase = true
vim.o.smartcase = true

-- Enable the 'sign column'; a column on the left hand side which can show information like breakpoints, git change indicators etc.
vim.o.signcolumn = 'yes'

-- Set the update time to 250 milliseconds. The update time is the amount of time Neovim waits until after you stop typing to execute plugin background process, write data to the swap file etc.
vim.o.updatetime = 250

-- Decrease the mapped sequence wait time, how long it takes to string keybind commands together
vim.o.timeoutlen = 300

-- Enables the ability to use vertical and horizontal splits, and in which direction those splits will occur. Vertical split command= :vsplit and horizontal = :split
vim.o.splitright = true
vim.o.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
--
--  Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--   See `:help lua-options`
--   and `:help lua-guide-options`
vim.o.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- When making substiutions (with :s) this allows for a live preview while doing so:
vim.o.inccommand = 'split'

-- Show which line the cursor is currently on:
vim.o.cursorline = true

-- Provides an offset from the top of the bottom of the screen when scrolling.
vim.o.scrolloff = 10

-- Create popups to confirm actions that would otherwise fail due to unsaved changes.
-- EG: Ask to save when quitting a file.
vim.o.confirm = true

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
