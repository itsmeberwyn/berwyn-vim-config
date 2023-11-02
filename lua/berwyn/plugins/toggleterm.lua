local status, toggleterm = pcall(require, "toggleterm")
if not status then
	return
end

toggleterm.setup({
	open_mapping = [[<c-j>]],
	size = 20,
	start_in_insert = false,
	close_on_exit = true,
})
