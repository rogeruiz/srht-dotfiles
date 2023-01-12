local icons = require("usr.icons")

local mason_ok, mason = pcall(require, "mason")
if not mason_ok then
  return
end

local mason_lspconfig_ok, mason_lsp = pcall(require, "mason-lspconfig")
if not mason_lspconfig_ok then
  return
end

local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

mason.setup({
  ui = {
    icons = {
      package_installed = icons.ui.Check,
      package_pending = icons.ui.HorizontalDots,
      package_uninstalled = icons.ui.Close,
    }
  }
})

mason_lsp.setup({
  ensure_installed = {
    "bashls",
    "diagnosticls",
    "dockerls",
    "efm",
    "eslint",
    "gopls",
    "html",
    "jsonls",
    "jedi_language_server",
    "marksman",
    "rnix",
    "ruby_ls",
    "spectral",
    "sumneko_lua",
    "taplo",
    "terraformls",
    "tsserver",
    "yamlls",
  },
})

mason_lsp.setup_handlers({
  function (server_name)
    lspconfig[server_name].setup({
      on_attach = require("lsp.handlers").on_attach,
      capabilities = require("lsp.handlers").capabilities,
    })
  end,
  ["sumneko_lua"] = function ()
    local opts = require("lsp.settings.sumneko_lua")
    lspconfig.sumneko_lua.setup(opts)
  end,
  ["jsonls"] = function ()
    local opts = require("lsp.settings.jsonls")
    lspconfig.jsonls.setup(opts)
  end,
  ["emmet_ls"] = function ()
    local opts = require("lsp.settings.emmet_ls")
    lspconfig.emmet_ls.setup(opts)
  end,
})
