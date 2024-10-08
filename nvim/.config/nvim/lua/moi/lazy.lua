require("lazy").setup({

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		-- or                              , branch = '0.1.x',
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{ "rose-pine/neovim", name = "rose-pine" },

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

	-- Markdown Preview
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	"github/copilot.vim",
})
