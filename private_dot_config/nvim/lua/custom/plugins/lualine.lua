return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        "catppuccin/nvim",
        "SmiteshP/nvim-navic",
    },
    -- See `:help lualine.txt`
    config = function()
        local colors = require("catppuccin.palettes").get_palette()
        local icons = require("custom.icons")
        local navic = require("nvim-navic")

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

        require("lualine").setup({
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
                    "dap-repl",
                    "dapui_breakpoints",
                    "dapui_scopes",
                    "dapui_stacks",
                    "dapui_watches",
                    "dashboard",
                    "dbout",
                    "dbui",
                    "guihua",
                    "help",
                    "neo-tree",
                    "toggleterm",
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
                lualine_x = {
                    {
                        "diagnostics",
                        source = { "nvim" },
                        sections = { "error", "warn", "info", "hint" },
                        diagnostics_color = {
                            error = { bg = colors.red, fg = colors.crust },
                            warn = { bg = colors.yellow, fg = colors.crust },
                            info = { bg = colors.teal, fg = colors.crust },
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
                lualine_a = {
                    {
                        "filename",
                        icon = icons.ui.NewFile .. " ",
                        icons_enabled = true,
                        file_status = false,
                        path = 1,
                        shorting_target = 50,
                    },
                },
                lualine_b = {
                    {
                        modified,
                        icon = icons.git.Diff .. "",
                        icons_enabled = true,
                        color = { bg = colors.blue, fg = colors.mantle },
                    },
                },
                lualine_c = {
                    {
                        function()
                            return navic.get_location()
                        end,
                        cond = function()
                            return navic.is_available()
                        end,
                    },
                },
                lualine_x = {},
                lualine_y = { "filetype" },
                lualine_z = {},
            },
            inactive_winbar = {
                lualine_a = { "filetype" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = { "filetype" },
                lualine_z = {},
            },
            extensions = {},
        })
    end,
}
