vim.g["test#strategy"] = "neovim"

vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<CR>", { noremap = true, silent = true }) -- Test nearest test
vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<CR>", { noremap = true, silent = true }) -- Test file
vim.keymap.set("n", "<leader>ts", "<cmd>TestSuite<CR>", { noremap = true, silent = true }) -- Test suite
vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<CR>", { noremap = true, silent = true }) -- Test last test run
vim.keymap.set("n", "<leader>tv", "<cmd>TestVisit<CR>", { noremap = true, silent = true }) -- Test visit
