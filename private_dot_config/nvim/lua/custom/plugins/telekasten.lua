local home = vim.fn.expand("~/Dropbox/zettelkasten")

return {
    'renerocksai/telekasten.nvim',
    dependencies = {
        'nvim-telescope/telescope.nvim',
        "renerocksai/calendar-vim",
    },
    opts = {
        home = home,
    },
}
