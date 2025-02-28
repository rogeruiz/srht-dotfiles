--                              __               __                 _
--                             /\ \             /\ \              /'_`\
--       __   __  __     __    \ \ \___   __  __\ \ \____    ___ /\_\/\`\
--     /'__`\/\ \/\ \  /'__`\   \ \  _ `\/\ \/\ \\ \ '__`\  / __`\/_//'/'
--    /\ \L\ \ \ \_\ \/\  __/    \ \ \ \ \ \ \_\ \\ \ \L\ \/\ \L\ \ /\_\
--    \ \___, \ \____/\ \____\    \ \_\ \_\ \____/ \ \_,__/\ \____/ \/\_\
--     \/___/\ \/___/  \/____/     \/_/\/_/\/___/   \/___/  \/___/   \/_/
--          \ \_\
--           \/_/
--
-- Esta es mi configuracíon de Neovim que yo uso. Empece con
-- `nvim-lua/kickstart.nvim` para empezar pero ya es una configuracíon
-- que me queda más amamble.
--
-- Por mas informacíon de todo esto, vaya a
-- `https://git.sr.ht/~rogeruiz/.files` para vir más sobre todo los
-- elementos de mi configuracíon
--
-- Gracias por leer y disfruten el viaje.

-- Establecer Espacio como tecla de líder
-- Mire `:help mapleader`
--  NOTE: Debe suceder antes de que se requieran complementos (de lo contrario,
--  se usará un líder incorrecto)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--       ___       ___           ___           ___
--      /\__\     /\  \         /\  \         |\__\
--     /:/  /    /::\  \        \:\  \        |:|  |
--    /:/  /    /:/\:\  \        \:\  \       |:|  |
--   /:/  /    /::\~\:\  \        \:\  \      |:|__|__
--  /:/__/    /:/\:\ \:\__\ _______\:\__\     /::::\__\
--  \:\  \    \/__\:\/:/  / \::::::::/__/    /:/~~/~
--   \:\  \        \::/  /   \:\~~\~~       /:/  /
--    \:\  \       /:/  /     \:\  \        \/__/
--     \:\__\     /:/  /       \:\__\
--      \/__/     \/__/         \/__/
-- Instalar administrador de paquetes
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` para más informacíon
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- NOTE: Aquí es donde instalas tus complementos
-- Puedes configurar tus complementos usando la llave `config` o la
-- meza `opts = {}`
require('lazy').setup({

  -- Complementos relacionados con Git
  { import = 'tools.git' },

  -- Complementos relacionados con texto
  { import = "tools.text" },

  'nvim-lua/popup.nvim',

  -- {
  --   '3rd/image.nvim',
  --   build = false,
  --   opts = {
  --     backend = "kitty",
  --     processor = "magick_cli",
  --     tmux_show_only_in_active_window = true,
  --     markdown = {
  --       enabled = true,
  --       clear_in_insert_mode = true,
  --       download_remote_images = true,
  --       only_render_image_at_cursor = true,
  --       floating_windows = false,              -- if true, images will be rendered in floating markdown windows
  --       filetypes = { "markdown", "vimwiki" }, -- markdown extensions (ie. quarto) can go here
  --     },
  --     kitty_method = "normal",
  --   },
  -- },

  { import = 'tools.database' },

  -- NOTE: Aquí es donde puedes instalar so complementos sobre LSP. La
  -- configuracíon del LSP esta abajo. Busque con `lspconfig` para incontrarlo.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP status progress
      {
        'j-hui/fidget.nvim',
        opts = {
          text = {
            spinner = "triangle",
          },
          window = { blend = 0 },
        },
        tag = "legacy",
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  --       ___           ___           ___           ___          _____          ___           ___           ___
  --      /__/\         /  /\         /  /\         /__/|        /  /::\        /  /\         /__/\         /__/\
  --     |  |::\       /  /::\       /  /::\       |  |:|       /  /:/\:\      /  /::\       _\_ \:\        \  \:\
  --     |  |:|:\     /  /:/\:\     /  /:/\:\      |  |:|      /  /:/  \:\    /  /:/\:\     /__/\ \:\        \  \:\
  --   __|__|:|\:\   /  /:/~/::\   /  /:/~/:/    __|  |:|     /__/:/ \__\:|  /  /:/  \:\   _\_ \:\ \:\   _____\__\:\
  --  /__/::::| \:\ /__/:/ /:/\:\ /__/:/ /:/___ /__/\_|:|____ \  \:\ /  /:/ /__/:/ \__\:\ /__/\ \:\ \:\ /__/::::::::\
  --  \  \:\~~\__\/ \  \:\/:/__\/ \  \:\/:::::/ \  \:\/:::::/  \  \:\  /:/  \  \:\ /  /:/ \  \:\ \:\/:/ \  \:\~~\~~\/
  --   \  \:\        \  \::/       \  \::/~~~~   \  \::/~~~~    \  \:\/:/    \  \:\  /:/   \  \:\ \::/   \  \:\  ~~~
  --    \  \:\        \  \:\        \  \:\        \  \:\         \  \::/      \  \:\/:/     \  \:\/:/     \  \:\
  --     \  \:\        \  \:\        \  \:\        \  \:\         \__\/        \  \::/       \  \::/       \  \:\
  --      \__\/         \__\/         \__\/         \__\/                       \__\/         \__\/         \__\/
  { import = "tools.markdown" },

  --       ___           ___                         ___
  --      /  /\         /  /\          ___          /  /\
  --     /  /::\       /  /:/         /__/\        /  /::\
  --    /  /:/\:\     /  /:/          \  \:\      /  /:/\:\
  --   /  /::\ \:\   /  /:/            \__\:\    /  /:/  \:\
  --  /__/:/\:\_\:\ /__/:/     /\      /  /::\  /__/:/ \__\:\
  --  \__\/  \:\/:/ \  \:\    /:/     /  /:/\:\ \  \:\ /  /:/
  --       \__\::/   \  \:\  /:/     /  /:/__\/  \  \:\  /:/
  --       /  /:/     \  \:\/:/     /__/:/        \  \:\/:/
  --      /__/:/       \  \::/      \__\/          \  \::/
  --      \__\/         \__\/                       \__\/
  --       ___           ___           ___                         ___       ___                         ___
  --      /  /\         /  /\         /  /\          ___          /  /\     /  /\          ___          /  /\
  --     /  /::\       /  /::\       /  /::|        /  /\        /  /:/    /  /::\        /__/\        /  /::\
  --    /  /:/\:\     /  /:/\:\     /  /:|:|       /  /::\      /  /:/    /  /:/\:\       \  \:\      /  /:/\:\
  --   /  /:/  \:\   /  /:/  \:\   /  /:/|:|__    /  /:/\:\    /  /:/    /  /::\ \:\       \__\:\    /  /::\ \:\
  --  /__/:/ \  \:\ /__/:/ \__\:\ /__/:/_|::::\  /  /::\ \:\  /__/:/    /__/:/\:\ \:\      /  /::\  /__/:/\:\ \:\
  --  \  \:\  \__\/ \  \:\ /  /:/ \__\/  /~~/:/ /__/:/\:\_\:\ \  \:\    \  \:\ \:\_\/     /  /:/\:\ \  \:\ \:\_\/
  --   \  \:\        \  \:\  /:/        /  /:/  \__\/  \:\/:/  \  \:\    \  \:\ \:\      /  /:/__\/  \  \:\ \:\
  --    \  \:\        \  \:\/:/        /  /:/        \  \::/    \  \:\    \  \:\_\/     /__/:/        \  \:\_\/
  --     \  \:\        \  \::/        /__/:/          \__\/      \  \:\    \  \:\       \__\/          \  \:\
  --      \__\/         \__\/         \__\/                       \__\/     \__\/                       \__\/
  --
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      { 'L3MON4D3/LuaSnip', run = "make install_jsregexp" },
      'saadparwaiz1/cmp_luasnip',
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-cmdline",
      "dcampos/nvim-snippy",
      "dcampos/cmp-snippy",
      "f3fora/cmp-spell",
    },
  },

  -- Complemento útil para mostrarle combinaciones de teclas pendientes.
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { "<leader>b", group = "[B]uscar con Telescope" },
      { "<leader>c", group = "Acciones de [C]odigo" },
      { "<leader>g", group = "Usando [G]it" },
      { "<leader>n", group = "Usar [N]eogen" },
      { "<leader>t", group = "Espacio de [T]rabajo(s)" },
      { "<leader>z", group = "Telekasten" },
    },
  },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
    init = function()
      local ft = require('Comment.ft')
      ft.structurizr = { '# %s', '/* %s */' }
      ft.just = { '# %s' }
    end
  },

  --  __           ___
  -- /\ \__       /\_ \
  -- \ \ ,_\    __\//\ \      __    ____    ___    ___   _____      __
  --  \ \ \/  /'__`\\ \ \   /'__`\ /',__\  /'___\ / __`\/\ '__`\  /'__`\
  --   \ \ \_/\  __/ \_\ \_/\  __//\__, `\/\ \__//\ \L\ \ \ \L\ \/\  __/
  --    \ \__\ \____\/\____\ \____\/\____/\ \____\ \____/\ \ ,__/\ \____\
  --     \/__/\/____/\/____/\/____/\/___/  \/____/\/___/  \ \ \/  \/____/
  --                                                       \ \_\
  --                                                        \/_/
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  { 'nvim-telescope/telescope-ui-select.nvim' },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    --- La funcíon pa' configurar ha Telescope
    ---@return boolean # Cheque para validar si `make` esta instalado
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  {
    -- Resalte, edite y navegue por el código
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'andymass/vim-matchup',
    },
    build = ":TSUpdate",
  },

  -- NOTE: Siguiente paso en su viaje de Neovim: agregar/configurar
  --       "complementos" adicionales para kickstart
  --       Estos son algunos complementos de ejemplo que he incluido en el
  --       repositorio de kickstart.
  --       Descomente cualquiera de las líneas a continuación para habilitarlas.
  require 'kickstart.plugins.autoformat',
  require 'kickstart.plugins.debug',

  { import = 'custom.plugins' },
}, {
  change_detection = {
    enabled = true,
  },
})


-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
vim.o.hlsearch = true

-- Make line numbers default
vim.o.number = true
vim.o.relativenumber = true
vim.o.colorcolumn = "50,72,80,100"
vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamed'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.showmatch = false

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
--
vim.o.termguicolors = true

vim.o.smartindent = true

vim.o.whichwrap = "<,>,h,l"

vim.o.swapfile = false
vim.o.listchars = "eol:¬,tab:›·,trail:·,extends:›,precedes:‹"

-- Haga que las neuvas búfer aparescan abajo o a la derecha
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.foldmethod = "expr"
-- vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 3

vim.o.spelllang = "en,es"

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<C-Down>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Up>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize +2<CR>', { noremap = true, silent = true })

-- Keymaps para aumentar la indentacíon
vim.keymap.set('v', '<', '<gv', { noremap = true, silent = true })
vim.keymap.set('v', '>', '>gv', { noremap = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

--  __           ___
-- /\ \__       /\_ \
-- \ \ ,_\    __\//\ \      __    ____    ___    ___   _____      __
--  \ \ \/  /'__`\\ \ \   /'__`\ /',__\  /'___\ / __`\/\ '__`\  /'__`\
--   \ \ \_/\  __/ \_\ \_/\  __//\__, `\/\ \__//\ \L\ \ \ \L\ \/\  __/
--    \ \__\ \____\/\____\ \____\/\____/\ \____\ \____/\ \ ,__/\ \____\
--     \/__/\/____/\/____/\/____/\/___/  \/____/\/___/  \ \ \/  \/____/
--                                                       \ \_\
--                                                        \/_/
-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
    theme = "ivy",
    path_display = {
      truncate = 3,
    },
    layout_strategy = 'center',
    layout_config = {
      width = 0.7,
      preview_cutoff = 40,
      height = 0.3,
    },
    file_ignore_patterns = {
      "^.git/"
    },
  },
  extensions = {
    fzf = {},
    ['ui-select'] = {
      require('telescope.themes').get_ivy({}),
    }
  }
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- Enable telescope ui-select, if installed
pcall(require('telescope').load_extension, 'ui-select')

-- See `:help telescope.builtin`
vim.keymap.set(
  'n',
  'z=',
  require('telescope.builtin').spell_suggest,
  { desc = '[z=] Corregir la ortografía' }
)
vim.keymap.set(
  'n',
  '<leader>?',
  require('telescope.builtin').oldfiles,
  { desc = '[?] Buscar en los archivos recientes' }
)
vim.keymap.set(
  'n',
  '<leader><space>',
  require('telescope.builtin').buffers,
  { desc = '[ ] Buscar en búferes abiertos' }
)
vim.keymap.set(
  'n',
  '<leader>/',
  function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      -- winblend = 10,
      previewer = false,
    })
  end,
  { desc = '[/] Búsqueda aproximada en el búfer actual' }
)
vim.keymap.set(
  'n',
  '<leader>ba',
  function()
    require('telescope.builtin').find_files({ hidden = true })
  end,
  { desc = '[B]uscar [A]rchivos' }
)
vim.keymap.set(
  'n',
  '<leader>by',
  require('telescope.builtin').lsp_document_symbols,
  { desc = '[B]uscar S[i]mbolos' }
)
vim.keymap.set(
  'n',
  '<leader>bGS',
  require('telescope.builtin').git_status,
  { desc = '[B]uscar [G]it [S]tatus' }
)
vim.keymap.set(
  'n',
  '<leader>bGC',
  require('telescope.builtin').git_commits,
  { desc = '[B]uscar [G]it [C]ommits' }
)
vim.keymap.set(
  'n',
  '<leader>bs',
  require('telescope.builtin').help_tags,
  { desc = '[B]uscar [S]ocorro' }
)
vim.keymap.set(
  'n',
  '<leader>bp',
  require('telescope.builtin').grep_string,
  { desc = '[B]uscar la [P]alabra actual' }
)
vim.keymap.set(
  'n',
  '<leader>bg',
  function()
    require('telescope.builtin').live_grep({ hidden = true })
  end,
  { desc = '[B]uscar con [G]rep' }
)
vim.keymap.set(
  'n',
  '<leader>bd',
  require('telescope.builtin').diagnostics,
  { desc = '[B]uscar [D]iagnóstico' }
)
vim.keymap.set(
  'n',
  '<leader>br',
  require('telescope.builtin').resume,
  { desc = '[B]uscar [R]eanudar' }
)

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'c',
    'cpp',
    'go',
    'lua',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true, additional_vim_regex_highlighting = false },
  indent = { enable = true, disable = { 'python' } },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  matchup = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Configurar los parsers de Treesitter para lenguas novedosas
vim.treesitter.language.register('markdown', { 'mdx', 'telekasten' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Ir al mensaje de diagnóstico anterior" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Ir al siguiente mensaje de diagnóstico" })

-- LSP settings.
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ombrar')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  if (client.name ~= 'omnisharp') then
    local oe = require("omnisharp_extended")
    nmap('gd', oe.lsp_definition, '[G]oto [D]efinición')
    nmap('<leader>D', oe.lsp_type_definition, '[D]efinición de tipo')
    nmap('gr', oe.lsp_references, '[G]oto [R]eferencias')
    nmap('gI', oe.lsp_implementation, '[G]oto [I]mplementación')
  else
    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinición')
    nmap('<leader>D', vim.lsp.buf.type_definition, '[D]efinición de tipo')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferencias')
    nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementación')
  end

  nmap('<leader>sd', require('telescope.builtin').lsp_document_symbols, '[S]ímbolos de [D]ocumentos')
  nmap('<leader>st', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[S]ímbolos del Espacio de [T]rabajo')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Documentacíon Flotante')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Documentación Firma')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaracíon')
  nmap('<leader>ta', vim.lsp.buf.add_workspace_folder, 'Espacio de [T]rabajo [A]ñadir Carpeta')
  nmap('<leader>te', vim.lsp.buf.remove_workspace_folder, 'Espacio de [T]rabajo [E]liminar Carpeta')
  nmap('<leader>tl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, 'Espacio de [T]rabajo [L]ista de Carpertas')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Formatear el búfer actual con LSP' })

  -- Solomente prender ha _navic_ y _lsp-folding_ para ciertos servidores.
  if (client.name ~= "efm" and
        client.name ~= "diagnosticls" and
        client.name ~= "spectral" and
        client.name ~= "eslint" and
        client.name ~= "emmet_ls" and
        client.name ~= "rnix" and
        client.name ~= "nixd" and
        client.name ~= "tailwindcss") then
    require("nvim-navic").attach(client, bufnr)
  end
end

local lsp_config = function()
  local icons = require("custom.icons")
  local signs = {

    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn",  text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint",  text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo",  text = icons.diagnostics.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = true,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.set_log_level("OFF")
end

lsp_config()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  -- clangd = {},
  gopls = {
    completeUnimported = true,
    usePlaceholders = true,
    analyses = {
      unusedparams = true,
    },
  },
  -- pyright = {},
  pylsp = {
    plugins = {
      -- formatter options
      black = { enabled = true },
      autopep8 = { enabled = false },
      yapf = { enabled = false },
      -- linter options
      pylint = { enabled = true, executable = "pylint" },
      pyflakes = { enabled = false },
      pycodestyle = { enabled = false },
      -- type checker
      pylsp_mypy = { enabled = true },
      -- auto-completion options
      jedi_completion = { fuzzy = true },
      -- import sorting
      pyls_isort = { enabled = true },
    },
  },
  rust_analyzer = {},
  ts_ls = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
      diagnostics = {
        disable = { "missing-fields" },
      },
    },
  },
  tailwindcss = {
    settings = {
      tailwindCSS = {
        experimental = {
          classRegex = {
            "cva\\(([^)]*)\\)",
            "[\"'`]([^\"'`]*).*?[\"'`]",
          }
        }
      },
    },
  },
  yamlls = {
    yaml = {
      format = {
        enable = false,
      },
      schemas = {
        ["https://json.schemastore.org/circleciconfig.json"] = "/.circleci/*",
        ["https://json.schemastore.org/github-action.json"] = "/.github/actions/*",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://raw.githubusercontent.com/distinction-dev/alacritty-schema/main/alacritty/reference.json"] =
        "/.alacritty.yml",
        ["https://json.schemastore.org/lefthook.json"] = "/lefthook.yml",
      }
    }
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Setup mason so it can manage external tooling
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- local s9r_client = vim.lsp.start_client({
--   name = "c4-language-server",
--   cmd = { "/Users/yo/.local/bin/darwin/c4-language-server/bin/c4-language-server" },
--   on_attach = on_attach,
-- })
--
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "structurizr",
--   callback = function()
--     vim.lsp.buf_attach_client(0, s9r_client)
--   end,
-- })

require('lspconfig').nixd.setup({
  cmd = { 'nixd' },
  on_attach = on_attach,
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "nixfmt" },
      },
      options = {
        home_manager = {
          expr = "(builtins.getFlake \"/Users/yo/.files.nix\").nixosConfigurations.x86_64.options",
        },
      },
    }
  }
})

require('lspconfig').omnisharp.setup({
  cmd = { 'dotnet', '/nix/store/dfxx8m2h69r8848hk4hd31ya87hial7c-omnisharp-roslyn-1.39.12/lib/omnisharp-roslyn/OmniSharp.dll' },
  on_attach = on_attach,
  settings = {
    FormattingOptions = {
      -- Enables support for reading code style, naming convention and analyzer
      -- settings from .editorconfig.
      EnableEditorConfigSupport = true,
      -- Specifies whether 'using' directives should be grouped and sorted during
      -- document formatting.
      OrganizeImports = nil,
    },
    MsBuild = {
      -- If true, MSBuild project system will only load projects for files that
      -- were opened in the editor. This setting is useful for big C# codebases
      -- and allows for faster initialization of code navigation features only
      -- for projects that are relevant to code that is being edited. With this
      -- setting enabled OmniSharp may load fewer projects and may thus display
      -- incomplete reference lists for symbols.
      LoadProjectsOnDemand = nil,
    },
    RoslynExtensionsOptions = {
      -- Enables support for roslyn analyzers, code fixes and rulesets.
      EnableAnalyzersSupport = nil,
      -- Enables support for showing unimported types and unimported extension
      -- methods in completion lists. When committed, the appropriate using
      -- directive will be added at the top of the current file. This option can
      -- have a negative impact on initial completion responsiveness,
      -- particularly for the first few completion sessions after opening a
      -- solution.
      EnableImportCompletion = nil,
      -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
      -- true
      AnalyzeOpenDocumentsOnly = nil,
    },
    Sdk = {
      -- Specifies whether to include preview versions of the .NET SDK when
      -- determining which version to use for project loading.
      IncludePrereleases = true,
    },
  }
})

-- nvim-cmp setup
--                 __
--   ___   __  __ /\_\    ___ ___              ___    ___ ___   _____
-- /' _ `\/\ \/\ \\/\ \ /' __` __`\  _______  /'___\/' __` __`\/\ '__`\
-- /\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \/\______\/\ \__//\ \/\ \/\ \ \ \L\ \
-- \ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\/______/\ \____\ \_\ \_\ \_\ \ ,__/
--  \/_/\/_/\/__/    \/_/\/_/\/_/\/_/         \/____/\/_/\/_/\/_/\ \ \/
--                                                                \ \_\
--                                                                 \/_/
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.set_config({
  history = false,
  updateevents = "TextChanged,TextChangedI",
})

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua", true)) do
  loadfile(ft_path)()
end

vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true })

cmp.setup {
  completion = {
    -- autocomplete = false,
    -- keyword_length = 3,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  experimental = {
    ghost_test = true,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<C-y'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      local kind_icons = require("custom.icons").kind
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- NOTE: order matters
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        path = "[Path]",
        emoji = "[Emoji]",
        buffer = "[Buffer]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'emoji' },
    { name = 'luasnip' },
  }, {
    { name = "buffer" },
  }),
  cmp.setup.filetype({ 'lisp' }, {
    sources = {
      { name = "nvlime" },
    },
  }),
  cmp.setup.cmdline({ "/", "?" },
    {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    }),
  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "cmdline" },
    }, {
      { name = "path" },
    }),
  }),
}

-- local completionDelay = 750
-- local timer = nil
--
-- function _G.setAutoCompleteDelay(delay)
--   completionDelay = delay
-- end
--
-- function _G.getAutoCompleteDelay()
--   return completionDelay
-- end
--
-- vim.api.nvim_create_autocmd({ "TextChangedI", "CmdlineChanged" }, {
--   pattern = "*",
--   callback = function()
--     if timer then
--       vim.loop.timer_stop(timer)
--       timer = nil
--     end
--
--     timer = vim.loop.new_timer()
--     timer:start(
--       _G.getAutoCompleteDelay(),
--       0,
--       vim.schedule_wrap(function()
--         cmp.complete({ reason = cmp.ContextReason.Auto })
--       end)
--     )
--   end,
-- })

-- Keymaps genericos
vim.keymap.set('n', '<leader>nr', '<cmd>set relativenumber!<cr>', { desc = 'Alternar [n]umeros [r]elativos' })

-- Filetype mappings
vim.cmd([[
  au BufRead,BufNewFile *.jshintrc set ft=json
  au BufRead,BufNewFile *.bowerrc set ft=json
  au BufRead,BufNewFile *.pantheonrc set ft=json
  au BufRead,BufNewFile *.eslintrc set ft=json
  au BufRead,BufNewFile *.txt set ft=markdown
  au BufRead,BufNewFile *.text set ft=markdown
  au BufRead,BufNewFile *.applescript set ft=applescript
  au BufNewFile,BufRead *.php set ft=php.html.js.css
  au BufNewFile,BufRead *.blade.php set ft=blade.html.php
  au BufNewFile,BufRead *.ejs set ft=liquid.html.js.css
  au BufNewFile,BufRead *.twig set ft=html.twig
  au BufNewFile,BufRead *.hbs set ft=html
  au BufNewFile,BufRead *.toml set ft=toml
  au BufNewFile,BufRead *.js set ft=javascript
  au BufNewFile,BufRead *.jsx set ft=javascript
  au BufNewFile,BufRead nginx.config set ft=nginx
  au BufRead,BufNewFile spec set ft=yaml
  au BufNewFile,BufRead *.ledger set ft=ledger
  au BufNewFile,BufRead .env* set ft=sh
  au BufNewFile,BufRead Brewfile set ft=ruby
  au BufNewFile,BufRead sketchybarrc set ft=sh
]])

vim.cmd([[
  au TermOpen * setlocal nonumber norelativenumber
]])

-- Filetypes configurations
vim.cmd([[
  au FileType markdown setlocal shiftwidth=4 tabstop=4 wrap spell expandtab tw=80 wm=0 linebreak list
  au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
  au FileType toml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
  au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=80 wm=0 linebreak list
  au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=80 wm=0 linebreak list
  au FileType dbui setlocal shiftwidth=2 tabstop=2 expandtab wrap
]])

vim.cmd([[
let g:loaded_matchit = 1
]])

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
