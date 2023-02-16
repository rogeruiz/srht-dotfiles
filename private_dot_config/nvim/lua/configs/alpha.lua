local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local function random_header_figlet()
	math.randomseed(os.time())
	local headers = {
		{
			[[         _             _            _      _          _        _         _   _       ]],
			[[        /\ \     _    /\ \         /\ \   /\ \    _ / /\      /\ \      /\_\/\_\ _   ]],
			[[       /  \ \   /\_\ /  \ \       /  \ \  \ \ \  /_/ / /      \ \ \    / / / / //\_\ ]],
			[[      / /\ \ \_/ / // /\ \ \     / /\ \ \  \ \ \ \___\/       /\ \_\  /\ \/ \ \/ / / ]],
			[[     / / /\ \___/ // / /\ \_\   / / /\ \ \ / / /  \ \ \      / /\/_/ /  \____\__/ /  ]],
			[[    / / /  \/____// /_/_ \/_/  / / /  \ \_\\ \ \   \_\ \    / / /   / /\/________/   ]],
			[[   / / /    / / // /____/\    / / /   / / / \ \ \  / / /   / / /   / / /\/_// / /    ]],
			[[  / / /    / / // /\____\/   / / /   / / /   \ \ \/ / /   / / /   / / /    / / /     ]],
			[[ / / /    / / // / /______  / / /___/ / /     \ \ \/ /___/ / /__ / / /    / / /      ]],
			[[/ / /    / / // / /_______\/ / /____\/ /       \ \  //\__\/_/___\\/_/    / / /       ]],
			[[\/_/     \/_/ \/__________/\/_________/         \_\/ \/_________/        \/_/        ]],
			[[                                                                                     ]],
		},
		{
			[[      ___           ___           ___                                      ___     ]],
			[[     /  /\         /  /\         /  /\          ___            ___        /  /\    ]],
			[[    /  /::|       /  /::\       /  /::\        /  /\          /__/\      /  /::|   ]],
			[[   /  /:|:|      /  /:/\:\     /  /:/\:\      /  /:/          \__\:\    /  /:|:|   ]],
			[[  /  /:/|:|__   /  /::\ \:\   /  /:/  \:\    /  /:/           /  /::\  /  /:/|:|__ ]],
			[[ /__/:/ |:| /\ /__/:/\:\ \:\ /__/:/ \__\:\  /__/:/  ___    __/  /:/\/ /__/:/_|::::\]],
			[[ \__\/  |:|/:/ \  \:\ \:\_\/ \  \:\ /  /:/  |  |:| /  /\  /__/\/:/~~  \__\/  /~~/:/]],
			[[     |  |:/:/   \  \:\ \:\    \  \:\  /:/   |  |:|/  /:/  \  \::/           /  /:/ ]],
			[[     |__|::/     \  \:\_\/     \  \:\/:/    |__|:|__/:/    \  \:\          /  /:/  ]],
			[[     /__/:/       \  \:\        \  \::/      \__\::::/      \__\/         /__/:/   ]],
			[[     \__\/         \__\/         \__\/           ~~~~                     \__\/]],
		},
		{
			[[ ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓]],
			[[ ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒]],
			[[▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░]],
			[[▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██ ]],
			[[▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒]],
			[[░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░]],
			[[░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░]],
			[[   ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░   ]],
			[[         ░    ░  ░    ░ ░        ░   ░         ░   ]],
			[[                                ░                  ]],
		},
		{
			[[                                                                    ]],
			[[                                                                    ]],
			[[ ________   _______   ________  ___      ___ ___  _____ ______      ]],
			[[|\   ___  \|\  ___ \ |\   __  \|\  \    /  /|\  \|\   _ \  _   \    ]],
			[[\ \  \\ \  \ \   __/|\ \  \|\  \ \  \  /  / | \  \ \  \\\__\ \  \   ]],
			[[ \ \  \\ \  \ \  \_|/_\ \  \\\  \ \  \/  / / \ \  \ \  \\|__| \  \  ]],
			[[  \ \  \\ \  \ \  \_|\ \ \  \\\  \ \    / /   \ \  \ \  \    \ \  \ ]],
			[[   \ \__\\ \__\ \_______\ \_______\ \__/ /     \ \__\ \__\    \ \__\]],
			[[    \|__| \|__|\|_______|\|_______|\|__|/       \|__|\|__|     \|__|]],
			[[                                                                    ]],
		},
		{
			[[  __   __    _____   _____     _     _   __    __    __   ]],
			[[ /_/\ /\_\ /\_____\ ) ___ (   /_/\ /\_\ /\_\  /_/\  /\_\  ]],
			[[ ) ) \ ( (( (_____// /\_/\ \  ) ) ) ( ( \/_/  ) ) \/ ( (  ]],
			[[/_/   \ \_\\ \__\ / /_/ (_\ \/_/ / \ \_\ /\_\/_/ \  / \_\ ]],
			[[\ \ \   / // /__/_\ \ )_/ / /\ \ \_/ / // / /\ \ \\// / / ]],
			[[ )_) \ (_(( (_____\\ \/_\/ /  \ \   / /( (_(  )_) )( (_(  ]],
			[[ \_\/ \/_/ \/_____/ )_____(    \_\_/_/  \/_/  \_\/  \/_/  ]],
			[[                                                          ]],
		},
	}
	return headers[math.random(1, #headers)]
end

-- Set header
local fortune = require("alpha.fortune")
dashboard.section.header.val = fortune()

-- This function returns the name of the current directory and the parent
-- direcory and truncates the new path into two characters so it doesn't break
-- the dashboard theme.
local function get_current_directory()
	local directory_length = 20
	local wd = os.getenv("PWD")
	wd = wd:match("^.+/(.+/.+)$") -- Matches the last two directories.
	if wd == nil then
		return os.getenv("PWD")
	end
	if #wd > directory_length then
		wd = string.sub(wd, 0, directory_length) .. "..." -- Truncates the second directory with three dots.
	end
	return wd
end

-- Set menu
local icons = require("usr.icons")
dashboard.section.buttons.val = {
	dashboard.button("n", icons.documents.File .. "  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
	dashboard.button(
		"b",
		icons.ui.Search .. "  Busque archivos en " .. get_current_directory(),
		":cd $PWD | Telescope find_files find_command=rg,--ignore,--hidden,--files <CR>"
	),
	dashboard.button(
		"t",
		icons.ui.Search .. "  Busque texto en " .. get_current_directory(),
		":cd $PWD | Telescope live_grep find_command=rg,--ignore,--hidden,--files <CR>"
	),
	dashboard.button("r", icons.ui.History .. "  Reciente archivos", ":Telescope oldfiles<CR>"),
	dashboard.button("a", icons.ui.Gear .. "  Ajustes", ":e $MYVIMRC | :cd %:p:h | :NvimTreeToggle<CR>"),
	dashboard.button("s", icons.diagnostics.Error .. "  Salir de NVIM", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = random_header_figlet()

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2

]])
