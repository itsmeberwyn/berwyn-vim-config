-- local status, _ = pcall(vim.cmd, "colorscheme kanagawa")
local status, _ = pcall(vim.cmd, "colorscheme nightfly")
if not status then
	print("Colorscheme not found!")
	return
end
