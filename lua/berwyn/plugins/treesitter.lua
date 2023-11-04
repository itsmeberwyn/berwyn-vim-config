-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	-- this cause the issue when saving file that ask to add ! to override
	-- highlight = {
	-- 	enable = true,
	-- },
	--
	-- enable indentation
	-- this one breaks the indentation
	-- indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	-- if you receive `Error detected while processing InsertLeave Autocommands for "<buffer=1>":` reinstall the language below using TSInstall <language>
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"python",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"go",
	},
	-- auto install above language parsers
	auto_install = true,
})
