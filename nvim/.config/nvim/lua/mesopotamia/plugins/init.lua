return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "vim-airline/vim-airline" })
	use({ "vim-airline/vim-airline-themes" })
	use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
		},
		config = require("mesopotamia.plugins.cmp").setup(),
	})
	use({ "jbyuki/venn.nvim" })
	use({ "kevinhwang91/nvim-bqf" })
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = require("mesopotamia.plugins.indent_blankline").setup(),
	})
	use({ "machakann/vim-sandwich" })
	use({ "neovim/nvim-lspconfig" })
	use({ "norcalli/nvim-colorizer.lua" })
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
	use({ "nvim-treesitter/playground" })
	use({ "sheerun/vim-polyglot" })
	use({ "tpope/vim-fugitive" })
	use({ "tpope/vim-vinegar" })
	use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
	use {'dracula/vim', as = 'dracula'}
end)
