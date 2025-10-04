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
	use {'nvim-telescope/telescope.nvim', tag = '0.1.8', requires = { {'nvim-lua/plenary.nvim'} }}
	use {'nvim-treesitter/nvim-treesitter', branch = 'master', build = ':TSUpdate'}
	use {'neovim/nvim-lspconfig'}
	use {'hrsh7th/cmp-nvim-lsp'}
	use {'hrsh7th/cmp-buffer'}
	use {'hrsh7th/cmp-path'}
	use {'hrsh7th/cmp-cmdline'}
	use {'hrsh7th/nvim-cmp'}

  if packer_bootstrap then
    require('packer').sync()
  end
end)

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

require('cmp').setup({
	mapping = require('cmp').mapping.preset.insert({
		["<Tab>"] = require('cmp').mapping.confirm({ select = true })
	}),
	sources = require('cmp').config.sources ({
		{ name = 'nvim-lsp' } },
		{ { name = 'buffer' } })
})

