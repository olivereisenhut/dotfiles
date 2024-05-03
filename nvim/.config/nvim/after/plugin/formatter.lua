local defaults = require("formatter.defaults")
local util = require("formatter.util")

require("formatter").setup({
	logging = true,
	log_level = vim.log.levels.WARN,
	filetype = {
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		php = {
			util.copyf(defaults.prettier),
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		yml = {
			require("formatter.filetypes.yaml").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		sh = {
			require("formatter.filetypes.sh").shfmt,
		},
        rust = {
			require("formatter.filetypes.rust").rustfmt,
        }
	},
})

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
augroup("__formatter__", { clear = true })
autocmd("BufWritePost", {
	group = "__formatter__",
	command = ":FormatWrite",
})
