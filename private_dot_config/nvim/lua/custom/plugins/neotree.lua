-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>o",
      "<cmd>Neotree float<cr>",
      mode = "n",
      desc = "Enfocar el Explorardor"
    },
  },
  opts = {
    enable_git_status = true,
    enable_diagnostics = true,
    source_selector = {
      winbar = false,
      statusline = false
    },
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = false,
      },
    },
    window = {
      position = "float",
      popup = {
        height = "80%",
        width = "50%",
      },
    },
  },
  config = function(_, opts)
    require('neo-tree').setup(opts)
  end,
}
