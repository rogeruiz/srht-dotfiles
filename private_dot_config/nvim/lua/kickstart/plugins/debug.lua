-- debug.lua
--
-- Shows how to use the DAP plugin to debug your code.
--
-- Primarily focused on configuring the debugger for Go, but can
-- be extended to other languages as well. That's why it's called
-- kickstart.nvim and not kitchen-sink.nvim ;)

return {
  -- NOTE: Yes, you can install new plugins here!
  'mfussenegger/nvim-dap',
  -- NOTE: And you can specify dependencies as well
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_setup = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {
        function(config)
          require("mason-nvim-dap").default_setup(config)
        end,
      },

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
        'delve',
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<F5>', dap.continue)
    vim.keymap.set('n', '<F6>', dap.step_into)
    vim.keymap.set('n', '<F7>', dap.step_over)
    vim.keymap.set('n', '<F8>', dap.step_out)
    vim.keymap.set('n', '<leader>p', dap.toggle_breakpoint, { desc = "Añadir un punto para pausar" })
    vim.keymap.set('n', '<leader>P', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = "Añadir un punto con expresíon para pausar" })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Colocar los iconos de DAP-UI con los predetermindas de menu de adyuda, |:h nvim-dap-ui|.
      icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
      },
      controls = {
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
    }

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- Definir iconos para `nvim-dap` como se definan en la adyuda, |:h dap.txt| y busce por *SIGNS CONFIGURATION*.
    vim.fn.sign_define('DapBreakpoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointCondition', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapLogPoint', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapStopped', { text = '', texthl = '', linehl = '', numhl = '' })
    vim.fn.sign_define('DapBreakpointRejected', { text = '', texthl = '', linehl = '', numhl = '' })

    -- Esta funcíon exsite para que la funcíon interna de dap.utils no se corre cuando empiezo a Neovim. Porque
    -- cunado uso a dap.utils#pick_process directamente se requiere selecíonar el ID del processo cuando impiezo
    -- Neovim. Pero con esta funcíon puedo esperar hasta que llamo al DAP para ejecutar dap.utils#pick_process.
    local pick_process = function()
      return require("dap.utils").pick_process({ filter = "milmove_gin" })
    end

    -- Install golang specific config
    require('dap-go').setup({
      dap_configurations = {
        {
          name = "Debug Server",
          type = "go",
          request = "attach",
          mode = "local",
          processId = pick_process,
        },
      },
    })
  end,
}
