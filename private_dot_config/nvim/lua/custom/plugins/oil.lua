return {
  'stevearc/oil.nvim',
  keys = {
    {
      '<leader>na',
      '<cmd>Oil<cr>',
      mode = 'n',
      desc = '[n]avigar a la carpeta que contiene el [a]rchivo'
    }
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    columns = {
      'icon',
    },
  },
}

