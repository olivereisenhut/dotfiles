require("nvim-treesitter").install({
    "php",
    "phpdoc",
    "javascript",
    "typescript",
    "lua",
    "vim",
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "php", "javascript", "typescript", "lua", "vim" },
    callback = function()
        vim.treesitter.start()
    end,
})
