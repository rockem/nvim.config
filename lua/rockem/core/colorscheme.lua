local status, eli = pcall(vim.cmd, "colorscheme nightfox")
if not status then
	print("Color scheme not found")
	return
end
