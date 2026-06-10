require("conform").setup({
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "prefer",
	},
	formatters_by_ft = {
		go = { "gofmt", "goimports" },
		javascript = { "prettier", "eslint_d" },
		typescript = { "prettier", "eslint_d" },
		typescriptreact = { "prettier", "eslint_d" },
		php = { "prettier" },
		yaml = { "prettier" },
		yml = { "prettier" },
		json = { "prettier" },
		graphql = { "prettier" },
		sql = { "prettier" },
		lua = { "stylua" },
		sh = { "shfmt" },
		rust = { "rustfmt" },
		elixir = { "mixformat" },
	},
})
