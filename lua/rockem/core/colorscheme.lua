local status, eli = pcall(vim.cmd, "colorscheme nightfox")
if not status then
	print("Color scheme not found")
	return
end

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

