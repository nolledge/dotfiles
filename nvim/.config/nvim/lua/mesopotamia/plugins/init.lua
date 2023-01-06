return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ 'feline-nvim/feline.nvim'})
	use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
	use({ "neovim/nvim-lspconfig" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
		},
		config = require("mesopotamia.plugins.telescope").setup(),
	})
	use({ "nvim-treesitter/nvim-treesitter",
		config = require("mesopotamia.plugins.treesitter").setup() 
	})
	use({ "sheerun/vim-polyglot" })
	use({ "tpope/vim-fugitive" })
	use({ "airblade/vim-gitgutter" })
	use({ "tpope/vim-vinegar" })
	use {'dracula/vim', as = 'dracula'}
	use({ "mhinz/vim-grepper" })
	use({ "kyazdani42/nvim-web-devicons" }) -- statusline
end)
