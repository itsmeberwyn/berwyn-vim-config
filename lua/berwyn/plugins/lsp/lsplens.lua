local lsplens_status, lsplens = pcall(require, "lsp-lens")

if not lsplens_status then
	return
end

lsplens.setup()
