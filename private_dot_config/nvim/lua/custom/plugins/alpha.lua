---@module 'custom.plugins.alpha'
---@author 'Roger Steve Ruiz'
---@license 'MIT'

-- Vamos a siembra la aleatoriedad con la hora actual
math.randomseed(os.time())

---random_header returns a Figlet header from the custom Figlet headers I
---maintain in the custom.figlet_headers module.
---@return table # A random table for the header table from the custom.figlet_headers module
local function random_header_figlet()
    local headers = require("custom.figlet_headers")
    return headers[math.random(1, #headers)]
end

---pick_color returns a random color using the colors available in the current
---theme matched across String, Identifier, Keyword, and Number.
---@return string # A random color represented by highlight groups
local function pick_color()
    local colors = { "String", "Identifier", "Keyword", "Number" }
    return colors[math.random(#colors)]
end

---This function returns the name of the current directory and the parent
---direcory and truncates the new path into two characters so it doesn't break
---the dashboard theme.
---@return string? wd The working directory
local function get_current_directory()
    local directory_length = 20
    -- Matches the last two directories.
    local wd = os.getenv("PWD"):match("^.+/(.+/.+)$")
    if wd == nil then
        return os.getenv("PWD")
    elseif #wd > directory_length then
        -- Truncates the second directory with three dots.
        wd = string.sub(wd, 0, directory_length) .. "..."
    end
    return wd
end

return {
    "goolord/alpha-nvim",
    config = function()
        local alpha = require("alpha")
        local fortune = require("alpha.fortune")
        local dashboard = require("alpha.themes.dashboard")
        local icons = require("custom.icons")

        -- Set header
        dashboard.section.header.val = random_header_figlet()
        dashboard.section.header.opts.hl = pick_color()

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("n", icons.documents.File .. "  Nuevo archivo", ":ene <BAR> startinsert <CR>"),
            dashboard.button(
                "b",
                icons.ui.Search .. "  Busque archivos en " .. get_current_directory(),
                ":lua require('telescope.builtin').find_files({hidden=true})<CR>"
            ),
            dashboard.button(
                "t",
                icons.ui.Search .. "  Busque texto en " .. get_current_directory(),
                ":lua require('telescope.builtin').live_grep()<CR>"
            ),
            dashboard.button("r", icons.ui.History .. "  Reciente archivos", ":Telescope oldfiles<CR>"),
            dashboard.button("d", icons.ui.Pencil .. "  Diario de hoy", ":Neorg journal today<CR>"),
            dashboard.button("da", icons.ui.Pencil .. "  Diario de ayer", ":Neorg journal yesterday<CR>"),
            dashboard.button("dm", icons.ui.Pencil .. "  Diario de mañana", ":Neorg journal tomorrow<CR>"),
            dashboard.button("a", icons.ui.Gear .. "  Ajustes", ":e $MYVIMRC | :cd %:p:h | :Neotree<CR>"),
            dashboard.button("s", icons.diagnostics.Error .. "  Salir de NVIM", ":qa<CR>"),
        }

        -- Set footer
        dashboard.section.footer.val = fortune()
        dashboard.section.footer.opts.hl = pick_color()

        alpha.setup(dashboard.opts)

        -- Disable folding on alpha buffer
        vim.cmd([[
            autocmd FileType alpha setlocal nofoldenable
            autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
        ]])
    end
}
