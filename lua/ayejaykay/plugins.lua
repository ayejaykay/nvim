print("plugins.lua")

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	use {'wbthomason/packer.nvim'}
	use {'catppuccin/nvim', as='catppuccin'}
	use {'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' }}
	use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} }}
	use {'nvim-treesitter/nvim-treesitter', branch = 'master', build = ':TSUpdate'}
	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-nvim-lua'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/nvim-cmp'}
	use {'saadparwaiz1/cmp_luasnip'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- Catppuccin

require('catppuccin').setup({
	transparent_background = true,
	integrations = {
		cmp = true,
		nvimtree = true,
		lualine = true,
	},
})

-- Lualine 

require('lualine').setup({
	options = {
	    icons_enabled = true,
	    theme = 'auto',
	    component_separators = { left = '', right = ''},
	    section_separators = { left = '', right = ''},
	    disabled_filetypes = {
	      statusline = {},
	      winbar = {},
	    },
	    ignore_focus = {},
	    always_divide_middle = true,
	    always_show_tabline = true,
	    globalstatus = false,
	    refresh = {
	      statusline = 1000,
	      tabline = 1000,
	      winbar = 1000,
	      refresh_time = 16, -- ~60fps
	      events = {
		'WinEnter',
		'BufEnter',
		'BufWritePost',
		'SessionLoadPost',
		'FileChangedShellPost',
		'VimResized',
		'Filetype',
		'CursorMoved',
		'CursorMovedI',
		'ModeChanged',
	      },
	    }
	  },
	sections = {
	    lualine_a = {'mode'},
	    lualine_b = {'branch', 'diff', 'diagnostics'},
	    lualine_c = {'filename'},
	    lualine_x = {'encoding', 'fileformat', 'filetype'},
	    lualine_y = {'progress'},
	    lualine_z = {'location'}
	  },
	  inactive_sections = {
	    lualine_a = {},
	    lualine_b = {},
	    lualine_c = {'filename'},
	    lualine_x = {'location'},
	    lualine_y = {},
	    lualine_z = {}
	  },
	  tabline = {},
	  winbar = {},
	  inactive_winbar = {},
	  extensions = {}
})

-- Treesitter 

require('nvim-treesitter.configs').setup({
	ensure_installed = {"c", "cpp", "lua", "vimdoc", "markdown", "python"},
	highlight = {
	    enable = true,

	disable = function(lang, buf)
		local max_filesize = 100 * 1024 -- 100 KB
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
		if ok and stats and stats.size > max_filesize then
		    return true
		end
	end,
    	additional_vim_regex_highlighting = false,
  },
})

-- Telescope

require('telescope').setup({})

-- Nvim-cmp

local cmp = require('cmp')

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.confirm({ select = true })
	}),
	sources = cmp.config.sources ({
		{name = 'nvim_lsp'},
		{name = 'nvim_lua'},
		{name = 'path'},
		{name = 'luasnip'},
		{name = 'buffer', keyword_length = 5},
	})
})


