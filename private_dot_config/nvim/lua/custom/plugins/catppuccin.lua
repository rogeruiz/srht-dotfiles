return {
    -- Catppuccin theme
    'catppuccin/nvim',
    lazy = false,
    priority = 1000,
    name = "catppuccin",
    opts = {
        flavour = "mocha", -- latte, frappe, macchiato, mocha
        background = {
            -- :h background
            light = "latte",
            dark = "mocha",
        },
        transparent_background = true,
        term_colors = false,
        dim_inactive = {
            enabled = true,
            shade = "dark",
            percentage = 0.15,
        },
        no_italic = false, -- Force no italic
        no_bold = false,   -- Force no bold
        styles = {
            comments = { "italic" },
            conditionals = { "italic" },
            loops = {},
            functions = {},
            keywords = {},
            strings = {},
            variables = {},
            numbers = {},
            booleans = {},
            properties = {},
            types = {},
            operators = {},
        },
        color_overrides = {},
        custom_highlights = {},
        integrations = {
            cmp = true,
            dap = true,
            fidget = true,
            gitsigns = true,
            illuminate = true,
            indent_blankline = {
                enabled = true,
                colored_indent_levels = false
            },
            lsp_trouble = true,
            markdown = true,
            mason = true,
            mini = false,
            navic = true,
            neotree = true,
            noice = true,
            telescope = true,
            ts_rainbow2 = true,
            which_key = true,
        },
    },
    config = function()
        -- Establecer el color de fondo del tema más temprano
        vim.o.background = "light"
        vim.cmd.colorscheme 'catppuccin'
    end,
}
