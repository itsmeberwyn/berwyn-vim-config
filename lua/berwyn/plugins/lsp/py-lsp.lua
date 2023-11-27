local setup, pylsp = pcall(require, "py_lsp")
if not setup then
	return
end

pylsp.setup({
	host_python = "./.venv/Script",
})
