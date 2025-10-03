print("keymaps.lua")

vim.g.mapleader = " "

-- Telescope 

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Terminal 

vim.keymap.set('n', '<leader>jf', function() vim.cmd [[Ex]] end, { desc = 'Vim nav' })
vim.keymap.set('n', '<leader>term', function() vim.cmd [[terminal]] end, { desc = 'Vim terminal' })

-- Key Matches and Skips

function skip_char(c)
	local cur = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local char_at_cur = string.sub(line, cur+1, cur+1)
	print(char_at_cur)
	if char_at_cur == c then 
		return '<Right>'

	elseif c == "'" or c == '"' then 
		return c .. c .. '<Left>'
	else 
		return c
	end
end 

vim.keymap.set('i', '{', '{}<Left>', { desc = 'test' })
vim.keymap.set('i', '(', '()<Left>', { desc = 'test' })
vim.keymap.set('i', '[', '[]<Left>', { desc = 'test' })
vim.keymap.set('i', '}', function() return skip_char('}') end, { desc = 'test', expr = true })
vim.keymap.set('i', ')', function() return skip_char(')') end, { desc = 'test', expr = true })
vim.keymap.set('i', ']', function() return skip_char(']') end, { desc = 'test', expr = true })
vim.keymap.set('i', '"', function() return skip_char('"') end, { desc = 'test', expr = true })
vim.keymap.set('i', "'", function() return skip_char("'") end, { desc = 'test', expr = true }) -- What if we want to use an apostrophe?

-- Windows and Tabs

function help_vertical()
	local topic = input()
	vim.cmd(':vert help ' .. topic)
end

vim.keymap.set('n', '<leader>sv', function() vim.cmd [[vert split]] end, { desc = 'split window vertical'})
vim.keymap.set('n', '<leader>sh', function() vim.cmd [[split]] end, { desc = 'split window vertical'})
vim.keymap.set('n', '<leader>vh', function() help_vertical() end, { desc = 'open vertical help window for topic' })
vim.keymap.set('n', '<leader>tn', function() vim.cmd [[tabnext]] end, { desc = 'next tab' })
vim.keymap.set('n', '<leader>tp', function() vim.cmd [[-tabnext]] end, { desc = 'next previous' })
vim.keymap.set('n', '<leader>to', '<C-w>T', { desc = 'open window in new tab' })
vim.keymap.set('n', '<leader>wh', '<C-w>h', { desc = 'go to left window' })
vim.keymap.set('n', '<leader>wl', '<C-w>l', { desc = 'go to right window' })
vim.keymap.set('n', '<leader>wk', '<C-w>k', { desc = 'go to up window' })
vim.keymap.set('n', '<leader>wj', '<C-w>j', { desc = 'go to down window' })
