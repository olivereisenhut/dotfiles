require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["<C-p>"] = false,
	},
})

vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
