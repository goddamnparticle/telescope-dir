local has_telescope, telescope = pcall(require, "telescope")
local dir = require("dir.dir")

if not has_telescope then
	error("This plugins requires nvim-telescope/telescope.nvim")
end

return telescope.register_extension({
	setup = dir.setup,
	exports = { dir = dir.dir },
})
