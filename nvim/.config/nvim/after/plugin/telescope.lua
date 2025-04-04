local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>pf", function()
	builtin.find_files({ hidden = true })
end, {})
vim.keymap.set("n", "<leader>rf", builtin.buffers)
vim.keymap.set("n", "<C-p>", function()
	builtin.git_files({ show_untracked = true })
end, {})
vim.keymap.set("n", "<leader>ps", builtin.live_grep)
vim.keymap.set("n", "<leader>sf", builtin.current_buffer_fuzzy_find)
vim.keymap.set("n", "<leader><leader>", builtin.buffers)
