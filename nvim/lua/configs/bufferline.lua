local status_okay, bufferline = pcall(require, "bufferline")
if not status_okay then
  return
end

bufferline.setup({
  options = {
    diagnostics = "nvim_lsp",
    max_name_length = 20,
    seperator_style = "thick",
    always_show_bufferline = true,
    tab_size = 20,
    show_buffer_close_icons = false,
    show_close_icon = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Archivos",
        text_align = "center",
      },
    },
  },
})

vim.cmd([[
nnoremap <silent>[b :BufferLineCyclePrev<CR>
nnoremap <silent>]b :BufferLineCycleNext<CR>
nnoremap <silent><leader>bc :BufferLinePickClose<CR>
]])
