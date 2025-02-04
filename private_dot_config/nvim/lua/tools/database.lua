-- Para mejorar la experencia de usando un database con Neovim
return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    "tpope/vim-dadbod",
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
  },
  keys = {
    {
      '<leader>DB',
      '<cmd>DBUIToggle<cr>',
      mode = 'n',
      desc = 'Alternar interfaz de [D]ad[B]odUI'
    }
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
    vim.g.db_ui_show_database_icon = 1
    vim.g.db_ui_win_position = 'right'
    vim.g.db_ui_use_nvim_notify = 1
  end
}
