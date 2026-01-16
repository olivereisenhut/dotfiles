local function set_colorscheme_for_background()
	if vim.o.background == "dark" then
		vim.cmd("colorscheme flexoki-dark")
	else
		vim.cmd("colorscheme flexoki-light")
	end
end

-- adjust theme on option change
vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "background",
	callback = set_colorscheme_for_background,
})

-- wait for vim.o.background to be set
-- todo: instead of waiting for nvim to finish here this could should probably be defined in lazy.lua in the plugin config
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.defer_fn(set_colorscheme_for_background, 0)
	end,
})
