return {
  -- required for neorg
  {
  "vhyrro/luarocks.nvim",
  priority = 1000, -- Very high priority is required, luarocks.nvim should run as the first plugin in your config.
  config = true,
  },
  { "neovim/nvim-lspconfig"},
  -- Scala Metals
  { "scalameta/nvim-metals", dependencies = {"j-hui/fidget.nvim", opts = {}} },
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip'}
  },

  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
    dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    }
  },

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  'airblade/vim-gitgutter',
  'lewis6991/gitsigns.nvim',

  -- use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  {'dracula/vim', as = 'dracula'},
  'nvim-lualine/lualine.nvim', -- Fancier statusline
  {
    'lukas-reineke/indent-blankline.nvim', -- Add indentation guides even on blank lines
    main = 'ibl',
    opts = {},
  },
  'numToStr/Comment.nvim', -- "gc" to comment visual regions/lines
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  'softinio/scaladex.nvim',

  'dhruvasagar/vim-table-mode',

  -- Fuzzy Finder (files, lsp, etc)
  { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope-ui-select.nvim' } },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make', cond = vim.fn.executable 'make' == 1 },

  -- Path navigator
  'justinmk/vim-dirvish',

  -- Time tracking
  'wakatime/vim-wakatime',

  -- run tests quickly
  'vim-test/vim-test',

  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6', -- Recommended
    lazy = false, -- This plugin is already lazy
  },
}
