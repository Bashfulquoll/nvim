-- [[ Configure and install plugins ]]
--
-- Check status of plugins with :Lazy
--
-- You can press '?' in this menu for help. Use ':q' to close the window
--
-- To update plugins:
-- 	:Lazy update
--
require('lazy').setup({
	-- Modular approach: We are adding Lua definition files via 'require'
	-- This means a defintion file can be included via the path from:
	-- lua/path/name.lua
	
	-- Add Catppuccin theme:
	require 'plugins.catppuccin',
	require 'plugins.gitsigns'
})
