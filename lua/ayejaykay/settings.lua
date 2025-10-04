print("settings.lua")

vim.cmd [[hi Normal guibg=NONE ctermbg=NONE]]
vim.cmd [[hi CursorLine guibg='NvimDarkCyan' ctermbg=NONE]]

vim.cmd [[set number relativenumber]]

vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = 'gray', bold = true })
vim.api.nvim_set_hl(0, 'LineNr', { fg = 'white', bold = true })
vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = 'gray', bold = true })

