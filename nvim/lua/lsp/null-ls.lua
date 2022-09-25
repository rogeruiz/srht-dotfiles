local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions
-- local hover = null_ls.builtins.hover

-- https://github.com/prettier-solidity/prettier-plugin-solidity
-- npm install --save-dev prettier prettier-plugin-solidity
null_ls.setup({
  debug = false,
  update_on_insert = true,
  sources = {
    formatting.stylua,
    --[[ formatting.eslint_d, ]]
    --[[ formatting.prettierd, ]]
    formatting.terraform_fmt,

    --[[ code_actions.eslint_d, ]]
    code_actions.gitsigns,

    --[[ diagnostics.eslint_d, ]]
    diagnostics.vale.with({
      args = function(params)
        return {
          --'--config=' .. home .. '/.config/vale/vale.ini',
          "--no-exit",
          "--output",
          "JSON",
          "--ext",
          "." .. vim.fn.fnamemodify(params.bufname, ":e"),
        }
      end,
    }),
  },
  on_attach = function(_) -- client
    vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format({ timeout_ms = 2000 })")
  end,
})
