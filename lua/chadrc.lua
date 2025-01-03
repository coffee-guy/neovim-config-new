-- This file  needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

local colors = dofile(vim.g.base46_cache .. "colors")
-- for key, value in pairs(colors) do
--     print(key, value)
-- end
M.base46 = {
	theme = "everforest",

	hl_override = {
		-- lighten or darken base46 theme variable
		-- this will use the black color from base46.theme & lighten it by 2x
		-- negative number will darken it
		LineNr = { fg = colors.yellow },
		CursorLineNr = { fg = colors.red },
		CursorLine = {
			bg = "#443139"
			-- bg="#89dceb"
		}
	},
	-- hl_override = {
	-- 	-- Comment = { italic = true },
	-- 	-- ["@comment"] = { italic = true },
	-- 	LineNr = {fg = colors.red},
	-- 	CursorLineNr = {fg = colors.red},
	-- 	CursorLine = {
	-- 		bg="#443139"
	-- 		-- bg="#89dceb"
	-- 	}
	-- },
}

M.plugins = "plugins.custom"
return M
