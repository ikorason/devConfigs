---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["Q"] = { "<nop>", "NADA" },
  },
  v = {
    ["K"] = { ":m '<-2<CR>gv=gv'", "Keep selection, move up" },
    ["J"] = { ":m '>+1<CR>gv=gv'", "Keep selection, move down" }
  },
  x = {
    ["<leader>p"] = { "\"_dP" }
  }
}

-- more keybinds!

return M
