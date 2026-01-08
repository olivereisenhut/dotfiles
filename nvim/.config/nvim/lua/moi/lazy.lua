require("lazy").setup({

	-- searching
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-- the looks
	{ "kepano/flexoki-neovim", name = "flexoki" },
	-- Lua
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	"stevearc/oil.nvim",
	"mbbill/undotree",
	"vim-test/vim-test",

	-- git
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	-- used for autoformatting (prettier...)
	"mhartington/formatter.nvim",
	"editorconfig/editorconfig-vim",

	-- syntax highlighting
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- lsp
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Installing LSPs
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets
			{ "saadparwaiz1/cmp_luasnip" },
			{ "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	"j-hui/fidget.nvim",

	-- refactoring
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		lazy = false,
		opts = {},
	},

	-- markdown preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	"github/copilot.vim",
})
