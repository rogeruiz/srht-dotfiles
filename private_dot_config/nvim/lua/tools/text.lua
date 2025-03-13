--       ___           ___           ___           ___           ___
--      /\  \         /\  \         |\__\         /\  \         /\  \
--      \:\  \       /::\  \        |:|  |        \:\  \       /::\  \
--       \:\  \     /:/\:\  \       |:|  |         \:\  \     /:/\:\  \
--       /::\  \   /::\~\:\  \      |:|__|__       /::\  \   /:/  \:\  \
--      /:/\:\__\ /:/\:\ \:\__\ ____/::::\__\     /:/\:\__\ /:/__/ \:\__\
--     /:/  \/__/ \:\~\:\ \/__/ \::::/~~/~       /:/  \/__/ \:\  \ /:/  /
--    /:/  /       \:\ \:\__\    ~~|:|~~|       /:/  /       \:\  /:/  /
--    \/__/         \:\ \/__/      |:|  |       \/__/         \:\/:/  /
--                   \:\__\        |:|  |                      \::/  /
--                    \/__/         \|__|                       \/__/

return {
  {
    -- Soporte para Editorconfig escrito en Lua
    'gpanders/editorconfig.nvim',

    -- Detecta `tabstop` y `shiftwidth` usando varias métodos
    'tpope/vim-sleuth',

    -- Me ayuda con a resaltar las palabras que son las mismas bajo mi puntero
    'RRethy/vim-illuminate',

    -- Me ayuda soportar commentos en varias lenguas
    {
      'numToStr/Comment.nvim',
      opts = {},
      init = function()
        local ft = require('Comment.ft')
        ft.structurizr = { '# %s', '/* %s */' }
      end
    },

    -- { 'edluffy/hologram.nvim' },
  }
}
