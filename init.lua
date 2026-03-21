-- My Neovim Config:
-- Using Kickstart.nvim as a base to learn how to setup my own config line by line.
-- This is effectively sequentially transcribed for things I want from Kickstart.nvim: github.com/nvim-lua/kickstart.nvim/
--
--
-- Set <space> as the leader key
-- This means you hit space to then typing a command instead of the default '\'
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[Set options]]
require 'options'

-- [[Set Basic Keymaps]]
require 'keymaps'

-- [[Install and load Lazy plugin manager]]
require 'lazy-install'
