local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require("telescope.actions")
local icons = require("usr.icons")

telescope.setup({
	defaults = {

		prompt_prefix = icons.ui.Telescope .. " ",
		selection_caret = icons.ui.SelectionCaret,

		file_ignore_patterns = {
			".exercism/.*",
			".git/.*",
			".next/.*",
			"public/.*",
			"package-lock.json",
			"target/.*",
			"yarn.lock",
		},

		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,

				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,

				["<C-c>"] = actions.close,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,

				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
				["<C-l>"] = actions.complete_tag,
				["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			},

			n = {
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default,
				["<C-x>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,

				["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
				["<M-q>"] = actions.send_selected_to_qflist + actions.open_qflist,

				["j"] = actions.move_selection_next,
				["k"] = actions.move_selection_previous,
				["H"] = actions.move_to_top,
				["M"] = actions.move_to_middle,
				["L"] = actions.move_to_bottom,

				["<Down>"] = actions.move_selection_next,
				["<Up>"] = actions.move_selection_previous,
				["gg"] = actions.move_to_top,
				["G"] = actions.move_to_bottom,

				["<C-u>"] = actions.preview_scrolling_up,
				["<C-d>"] = actions.preview_scrolling_down,

				["<PageUp>"] = actions.results_scrolling_up,
				["<PageDown>"] = actions.results_scrolling_down,

				["?"] = actions.which_key,
				["<Tab>"] = nil,
				["<S-Tab>"] = nil,
			},
		},
	},

	layout_strategy = "horizontal",
	layout_config = {
		width = 0.95,
		height = 0.85,
		-- preview_cutoff = 120,
		prompt_position = "top",

		horizontal = {
			preview_width = function(_, cols, _)
				if cols > 200 then
					return math.floor(cols * 0.4)
				else
					return math.floor(cols * 0.6)
				end
			end,
		},

		vertical = {
			width = 0.9,
			height = 0.95,
			preview_height = 0.5,
		},

		flex = {
			horizontal = {
				preview_width = 0.9,
			},
		},
	},

	pickers = {
		find_files = {
			-- Usando la instrución `fd` porque es muy reapido y genial.
			find_command = { "fd", "--strip-cwd-prefix", "--type", "f" },
			mappings = {
				n = {
					["kj"] = "close",
				},
			},
		},
		git_status = {
			git_icons = {
				added = icons.git.Add,
				changed = icons.git.Mod,
				copied = icons.git.Rename,
				deleted = icons.git.Remove,
				renamed = icons.git.Rename,
				unmerged = icons.git.Diff,
				untracked = icons.git.Untracked,
			},
		},
	},
})

-- Key mappings
vim.cmd([[
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
nnoremap <leader>gs <cmd>lua require('telescope.builtin').git_status()<cr>
]])
