return {
  "lewis6991/gitsigns.nvim",
  config = function()
    local gitsigns = require("gitsigns")
    local ui = require("custom.icons").git.ui
    gitsigns.setup({
      signs                        = {
        add          = { text = ui.add_thickest, },
        change       = { text = ui.change_thickest, },
        delete       = { text = ui.delete_thickest, },
        topdelete    = { text = ui.topdelete_thickest, },
        changedelete = { text = ui.changedelete_thickest, },
        untracked    = { text = ui.untracked_thickest, },
      },
      signs_staged                 = {
        add          = { text = ui.add_thickest, },
        change       = { text = ui.change_thickest, },
        delete       = { text = ui.delete_thickest, },
        topdelete    = { text = ui.topdelete_thickest, },
        changedelete = { text = ui.changedelete_thickest, },
      },
      signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = true,  -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = true,  -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        interval = 1000,
        follow_files = true,
      },
      auto_attach                  = true,
      attach_to_untracked          = true,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text          = true,
        virt_text_pos      = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay              = 1000,
        ignore_whitespace  = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = ' <author>, <author_time:%R> 󰍩  <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil, -- Use default
      max_file_length              = 40000,
      preview_config               = {
        -- Options passed to nvim_open_win
        border   = "single",
        style    = "minimal",
        relative = "cursor",
        row      = 0,
        col      = 1,
      },
      on_attach                    = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          else
            vim.schedule(function()
              gs.next_hunk()
            end)
            return "<Ignore>"
          end
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          else
            vim.schedule(function()
              gs.prev_hunk()
            end)
            return "<Ignore>"
          end
        end, { expr = true })

        -- Actions
        map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "Git hunk stage" })
        map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "Git hunk reset" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Git buffer stage" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Git undo stage" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Git buffer reset" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Git preview hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line({ full = true })
        end, { desc = "Git blame line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame,
          { desc = "Palanca para mostrar linea de `git blame`" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Git diff file" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "" })
        map("n", "<leader>td", gs.preview_hunk_inline, { desc = "Git toggle deletions" })
        map("n", "<leader>hl", gs.toggle_linehl, { desc = "Git toggle line highlights" })

        -- Text object
        map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Git text objects select_hunk" })
      end,
    })
  end
}
