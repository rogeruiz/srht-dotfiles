return {
  {
    lazy = false,
    'arnarg/todotxt.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    opts = {
      todo_file = '~/Dropbox/zettelkasten/todo.txt',
      sidebar = {
        width = 80,
      },
      highlights = {
        project = "todo_txt_project",
        context = "todo_txt_context",
        date = "todo_txt_date",
        done_task = "todo_txt_done_task",
        priorities = {
          A = "todo_txt_pri_a",
          B = "todo_txt_pri_b",
          C = "todo_txt_pri_c",
          D = "todo_txt_pri_d",
        },
      },
    },
    keys = {
      {
        "<LEADER>cre",
        "<CMD>:ToDoTxtCapture<CR>",
        mode = 'n',
        desc = "[C]aptura un [r][e]cordatorios",
      },
      {
        "<LEADER>are",
        "<CMD>:ToDoTxtTasksToggle<CR>",
        mode = 'n',
        desc = "[A]lternar los [r][e]cordatorios",
      }
    },
  },
}
