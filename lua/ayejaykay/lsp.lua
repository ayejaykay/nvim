print("lsp.lua")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config('lua_ls', {
	cmd = { 'lua-language-server' },
	filetypes = { 'lua' },
	root_markers = { '.git' },
	settings = {
		Lua = {
		runtime = {
			version = 'LuaJIT',
		},
	},
	diagnostics = {
		globals = { 'vim' },
	},
	},
	capabilities = capabilities
})

vim.lsp.config('pyright', {
	cmd = { 'pyright' },
	filetypes = { 'py' },
	root_markers = { '.git' },
	capabilities = capabilities
})

vim.lsp.config('clangd', {
	cmd = { 'clangd' },
	filetypes = {'c', 'cpp'},
	root_markers = { '.git' },
	capabilities = capabilities
})

vim.lsp.enable('lua_ls')
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')


