local status, venv = pcall(require, "venv-selector")
if not status then
	return
end

venv.setup()
