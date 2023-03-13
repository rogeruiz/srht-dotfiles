local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end

local status_navic_ok, navic = pcall(require, "nvim-navic")
if not status_navic_ok then
	return
end

local catppuccin_ok, catppuccin = pcall(require, "catppuccin.palettes")
if not catppuccin_ok then
	return
end

local colors = catppuccin.get_palette()

local icons = require("usr.icons")

-- local empty = require('lualine.component'):extend()
-- function empty:draw(default_highlight)
--   self.status = ''
--   self.applied_separator = ''
--   self:apply_highlights(default_highlight)
--   self:apply_section_separators()
--   return self.status
-- end

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
	return function(str)
		local win_width = vim.fn.winwidth(0)
		if hide_width and win_width < hide_width then
			return ""
		elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
			return str:sub(1, trunc_len) .. (no_ellipsis and "" or "...")
		end
		return str
	end
end

local function search_result()
	if vim.v.hlsearch == 0 then
		return ""
	end
	local last_search = vim.fn.getreg("/")
	if not last_search or last_search == "" then
		return ""
	end
	local searchcount = vim.fn.searchcount({ maxcount = 9999 })
	return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
end

local function location_with_icons()
	return "%l " .. icons.ui.LineNumber .. " %c " .. icons.ui.ColumnNumber
end

local function linenumber_with_icons()
	return "%p%%" .. icons.ui.SeparatorForward .. "  %L"
end

local function modified()
	if vim.bo.modified then
		return "+"
	elseif vim.bo.modifiable == false or vim.bo.readonly == true then
		return "-"
	end
	return ""
end

lualine.setup({
	options = {
		icons_enabled = true,
		theme = "catppuccin",
		component_separators = {
			left = icons.ui.PowerlineRightEmpty,
			right = icons.ui.PowerlineLeftEmpty,
		},
		section_separators = {
			left = icons.ui.PowerlineRightFill,
			right = icons.ui.PowerlineLeftFill,
		},
		disabled_filetypes = {
			"alpha",
			"dashboard",
			"toggleterm",
			"NvimTree",
			"dap-repl",
			"dapui_watches",
			"dapui_stacks",
			"dapui_breakpoints",
			"dapui_scopes",
		},
		always_divide_middle = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = trunc(80, 4, nil, true),
			},
		},
		lualine_b = {
			{
				"b:gitsigns_head",
				icon = "",
				fmt = trunc(80, 4, nil, true),
			},
			{
				"diff",
				source = diff_source,
			},
		},

		lualine_c = {},
		lualine_x = {
			{
				"diagnostics",
				source = { "nvim" },
				sections = { "error", "warn", "info", "hint" },
				diagnostics_color = {
					error = { bg = colors.maroon, fg = colors.crust },
					warn = { bg = colors.peach, fg = colors.crust },
					info = { bg = colors.blue, fg = colors.crust },
					hint = { bg = colors.rosewater, fg = colors.crust },
				},
				always_visible = false,
			},
		},
		lualine_y = { search_result },
		lualine_z = {
			"fileformat",
			location_with_icons,
			linenumber_with_icons,
		},
	},
	inactive_sections = {
		lualine_b = {
			{
				"b:gitsigns_head",
				icon = "",
				fmt = trunc(80, 4, nil, true),
			},
			{
				"diff",
				source = diff_source,
			},
		},

		lualine_c = {
			{
				"filename",
				icon = icons.ui.NewFile .. " ",
				icons_enabled = true,
				file_status = true,
				path = 2,
			},
		},
		lualine_z = {
			"fileformat",
			location_with_icons,
			linenumber_with_icons,
		},
	},
	tabline = {},
	winbar = {
		lualine_c = {
			{
				"filename",
				icon = icons.ui.NewFile .. " ",
				icons_enabled = true,
				file_status = false,
				path = 1,
				shorting_target = 50,
			},
			{
				modified,
				icon = icons.git.Diff .. "",
				icons_enabled = true,
				color = { bg = colors.peach, fg = colors.mantle },
			},
			{ navic.get_location, cond = navic.is_available },
		},

		lualine_y = { "filetype" },
	},
	inactive_winbar = {
		lualine_c = {
			{
				"filename",
				icon = icons.ui.NewFile .. " ",
				icons_enabled = true,
				file_status = false,
				path = 1,
				shorting_target = 50,
			},
			{
				modified,
				icon = icons.git.Diff .. "",
				icons_enabled = true,
				color = { bg = colors.peach, fg = colors.mantle },
			},
			{ navic.get_location, cond = navic.is_available },
		},
		lualine_y = { "filetype" },
	},
	extensions = {},
})
