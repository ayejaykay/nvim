print("lsp.lua")

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
})

vim.lsp.config('pyright', {
	cmd = { 'pyright' },
	filetypes = { 'python' },
	root_markers = { '.git' }
})

vim.lsp.config('clangd', {
	cmd = { 'clangd' },
	filetypes = {'c', 'cpp'},
	root_markers = { '.git' }
})


