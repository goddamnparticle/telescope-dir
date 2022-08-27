local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local M = {}

M.dir = function(opts)
	opts = opts or {}
	local input = { "fd", ".", "/home/yorek/.config/nvim", "--type", "f", "" }
	pickers.new(opts, {
		prompt_title = "Configs",
		finder = finders.new_oneshot_job(input),
		sorter = conf.generic_sorter(opts),
		entry_maker = function(entry)
			return {
				value = entry,
				display = entry[2],
				ordinal = entry[1],
			}
		end,
	}):find(require("telescope.themes").get_dropdown({}))
end

return M
