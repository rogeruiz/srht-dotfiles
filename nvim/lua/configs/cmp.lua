local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local snippy_status_ok, snippy = pcall(require, "snippy")
if not snippy_status_ok then
  return
end

local icons = require("usr.icons")

local kind_icons = icons.kind

cmp.setup({
  snippet = {
    expand = function(args)
      snippy.expand_snippet(args.body)
    end,
  },
  experimental = {
    ghost_text = true,
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- NOTE: order matters
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Nvim]",
        buffer = "[Buffer]",
        path = "[Path]",
        spell = "[Spell]",
        emoji = "[Emoji]",
        snippy = "[Snippet]",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "buffer" },
    { name = "path" },
    { name = "spell" },
    { name = "emoji" },
    { name = "snippy" },
  }, {
    { name = "buffer" },
  }),

  cmp.setup.cmdline({ "/", "?" }),
  {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = "buffer" },
    },
  },

  cmp.setup.cmdline(":", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  }),
})
