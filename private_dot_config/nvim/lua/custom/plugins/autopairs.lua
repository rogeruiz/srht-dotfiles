---@module 'custom.plugins.autopairs'
---@author 'Roger Steve Ruiz'
---@license 'MIT'

return {
    "windwp/nvim-autopairs",
    dependencies = {
        "hrsh7th/nvim-cmp",
    },
    --- Configurar a `autopairs` con `cmp` y desactivar para `TelescopePrompt`
    config = function()
        local autopairs = require("nvim-autopairs")
        local cmp = require("cmp")

        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

        autopairs.setup({
            disable_filetype = {
                "TelescopePrompt",
            },
        })
    end
}
