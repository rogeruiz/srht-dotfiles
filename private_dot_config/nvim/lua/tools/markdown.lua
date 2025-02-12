return {
  {
    'itspriddle/vim-marked',
    ft = { "text", "markdown", "mkd", "ghmarkdown", "vimwiki" },
    keys = {
      {
        "<leader>mdp",
        "<cmd>MarkedToggle<cr>",
        desc = "Preview in Marked 2",
      },
    },
  },
}
