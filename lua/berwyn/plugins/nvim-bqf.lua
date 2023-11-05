-- not used, and not installed, just for future reference
-- responsible for quickfix in nvim
-- installed 	-- use({ "kevinhwang91/nvim-bqf" }) -- to used it back
local status, bqf = pcall(require, "nvim-bqf")

if not status then
	return
end

bqf.setup()
