require("lazy").setup({

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "rose-pine/neovim", name = "rose-pine" },

	{
		"folke/zen-mode.nvim",
		-- todo move me into own config
		config = function()
			require("zen-mode").setup({
				{
					width = 240,
				},
			})
		end,
	},

	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"mbbill/undotree",

	-- Git --
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",

	"vim-test/vim-test",

	-- used for autoformatting (prettier...)
	"mhartington/formatter.nvim",
	"editorconfig/editorconfig-vim",

	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "saadparwaiz1/cmp_luasnip" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
		},
	},

	"j-hui/fidget.nvim",

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	"github/copilot.vim",
})
