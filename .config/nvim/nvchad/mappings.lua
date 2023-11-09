---@type MappingsTable
local M = {}

M.general = {
	n = {
		[";"] = { ":", "enter command mode", opts = { nowait = true } },
		["Q"] = { "<nop>", "NADA" },
	},
	v = {
		["K"] = { ":m '<-2<CR>gv=gv'", "Keep selection, move up" },
		["J"] = { ":m '>+1<CR>gv=gv'", "Keep selection, move down" },
	},
	x = {
		["<leader>p"] = { '"_dP' },
	},
	i = {
		["<C-l>"] = {
			function()
				vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
			end,
			"Copilot Accept",
			{ replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true },
		},
	},
}

-- more keybinds!

return M
