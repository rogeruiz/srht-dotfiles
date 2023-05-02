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
--           Esta es mi configuracíon de Neovim que yo uso. Empece con
--           `nvim-lua/kickstart.nvim` para empezar pero ya es una configuracíon
--           que me queda más amamble.
--
--           Por mas informacíon de todo esto, vaya a
--           `https://git.sr.ht/~rogeruiz/.files` para vir más sobre todo los
--           elementos de mi configuracíon
--
--           Gracias por leer y disfruten el viaje.

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
  --       ___                       ___
  --     /\  \          ___        /\  \
  --    /::\  \        /\  \       \:\  \
  --   /:/\:\  \       \:\  \       \:\  \
  --  /:/  \:\  \      /::\__\      /::\  \
  -- /:/__/_\:\__\  __/:/\/__/     /:/\:\__\
  -- \:\  /\ \/__/ /\/:/  /       /:/  \/__/
  --  \:\ \:\__\   \::/__/       /:/  /
  --   \:\/:/  /    \:\__\       \/__/
  --    \::/  /      \/__/
  --     \/__/
  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  'nvim-lua/popup.nvim',

  -- Para mejorar la experencia de usando un database con Neovim
  {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
      "tpope/vim-dadbod",
    },
  },

  -- Editorconfig escrito en Lua
  'gpanders/editorconfig.nvim',

  'RRethy/vim-illuminate',

  -- NOTE: Aquí es donde puedes instalar so complementos sobre LSP. La
  -- configuracíon del LSP esta abajo. Busque con `lspconfig` para incontrarlo.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      {
        'j-hui/fidget.nvim',
        opts = {
          window = { blend = 0 },
        }
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },

  -- Markdown
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    run = "cd app && yarn install",
  },

  -- Autocompletacíon
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'L3MON4D3/LuaSnip',
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
  { 'folke/which-key.nvim',          opts = {} },

  -- "gc" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {},
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
  { 'nvim-telescope/telescope.nvim', version = '*', dependencies = { 'nvim-lua/plenary.nvim' } },

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
vim.wo.number = true
vim.wo.relativenumber = true
vim.o.colorcolumn = "50,72,80,100"

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
vim.o.termguicolors = true
vim.cmd("hi Normal guibg=NONE")
vim.cmd("au WinLeave * set nocursorline")
vim.cmd("au WinEnter * set cursorline")

vim.o.smartindent = true

vim.o.whichwrap = "<,>,h,l"

vim.o.swapfile = false
vim.o.listchars = "eol:¬,tab:›·,trail:·,extends:›,precedes:‹"

-- Haga que las neuvas búfer aparescan abajo o a la derecha
vim.o.splitbelow = true
vim.o.splitright = true

vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldlevel = 3

-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, silent = true })

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
    theme = "dropdown",
    layout_strategy = 'vertical',
    layout_config = {
      width = 0.80,
      height = 0.90,
      preview_height = 0.70,
    },
  },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Buscar en los archivos recientes' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Buscar en búferes abiertos' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Búsqueda aproximada en el búfer actual' })

vim.keymap.set('n', '<leader>ba', require('telescope.builtin').find_files, { desc = '[B]usca [A]rchivos' })
vim.keymap.set('n', '<leader>bs', require('telescope.builtin').help_tags, { desc = '[B]usca [S]ocorro' })
vim.keymap.set('n', '<leader>bp', require('telescope.builtin').grep_string, { desc = '[B]usca la [P]alabra actual' })
vim.keymap.set('n', '<leader>bg', require('telescope.builtin').live_grep, { desc = '[B]usca con [G]rep' })
vim.keymap.set('n', '<leader>bd', require('telescope.builtin').diagnostics, { desc = '[B]usca [D]iagnóstico' })

-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = {
    'c',
    'cpp',
    'go',
    'lua',
    'norg',
    'python',
    'rust',
    'tsx',
    'typescript',
    'vim',
    'vimdoc',
  },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = false,

  highlight = { enable = true },
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

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Ir al mensaje de diagnóstico anterior" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Ir al siguiente mensaje de diagnóstico" })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Abrir mensaje de diagnóstico flotante" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Abrir lista de diagnósticos" })

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

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinición')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferencias')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementación')
  nmap('<leader>D', vim.lsp.buf.type_definition, '[D]efinición de tipo')
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
      client.name ~= "eslint" and
      client.name ~= "emmet_ls" and
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
  gopls = {},
  -- pyright = {},
  rust_analyzer = {},
  tsserver = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
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

-- nvim-cmp setup
local cmp = require 'cmp'
local luasnip = require 'luasnip'

luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}

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
  au BufNewFile,BufRead *.toml set ft=toml
  au BufNewFile,BufRead *.js set ft=javascriptreact
  au BufNewFile,BufRead *.jsx set ft=javascriptreact
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
  au FileType norg setlocal wrap spell expandtab tw=80 wm=0 linebreak list
  au FileType yaml setlocal shiftwidth=2 tabstop=2 nowrap spell expandtab tw=80 wm=0 linebreak list
  au FileType gitcommit setlocal shiftwidth=4 tabstop=4 expandtab wrap spell tw=72 wm=0 linebreak list
]])

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
