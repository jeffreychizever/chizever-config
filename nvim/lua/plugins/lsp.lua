return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"williamboman/mason.nvim", "neovim/nvim-lspconfig", "nvim-java/nvim-java"},
    config = function()
        local mason = require("mason")
        mason.setup({
            PATH = "prepend"
        })

        local lsp = require("mason-lspconfig")
        lsp.setup({
            ensure_installed = { "lua_ls" },
        })

        local java = require('java')
        java.setup()

        local lspc = require("lspconfig")
        lspc.jdtls.setup({})
        lspc.lua_ls.setup({})
    end
}

