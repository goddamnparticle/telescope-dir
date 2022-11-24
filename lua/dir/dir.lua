local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values

local M = {}
local dir_maker
local setup_config

M.setup = function(config)
	setup_config = config
	dir_maker = function(entry)
		local path_remove = function(String)
			return string.gsub(String, setup_config.dir_path .. "/", "")
		end
		local disp = path_remove(entry)
		return { value = entry, display = disp, ordinal = disp }
	end
end

M.dir = function(opts)
	opts = opts or {}
	local input = { "fd", "--type", "f", ".", setup_config.dir_path }
	pickers.new(opts, {
		prompt_title = "Neovim Config Files",
		finder = finders.new_oneshot_job(input, { entry_maker = dir_maker }),
		sorter = conf.generic_sorter(opts),
	}):find()
end

return M
