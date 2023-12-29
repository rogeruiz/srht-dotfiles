local home = vim.fn.expand("~/Dropbox/zettelkasten")

return {
    'renerocksai/telekasten.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        "renerocksai/calendar-vim",
    },
    opts = {
        home = home,
        auto_set_filetype = false,
    },
    init = function()
        -- Most used functions
        vim.keymap.set("n", "<leader>zf", "<cmd>Telekasten find_notes<CR>")
        vim.keymap.set("n", "<leader>zg", "<cmd>Telekasten search_notes<CR>")
        vim.keymap.set("n", "<leader>zd", "<cmd>Telekasten goto_today<CR>")
        vim.keymap.set("n", "<leader>zz", "<cmd>Telekasten follow_link<CR>")
        vim.keymap.set("n", "<leader>zn", "<cmd>Telekasten new_note<CR>")
        vim.keymap.set("n", "<leader>zc", "<cmd>Telekasten show_calendar<CR>")
        vim.keymap.set("n", "<leader>zb", "<cmd>Telekasten show_backlinks<CR>")
        vim.keymap.set("n", "<leader>zI", "<cmd>Telekasten insert_img_link<CR>")
    end
}
