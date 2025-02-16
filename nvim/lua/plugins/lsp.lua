return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim", "neovim/nvim-lspconfig",
        "mfussenegger/nvim-lint", "rshkarin/mason-nvim-lint",
        "nvim-java/nvim-java"},
    config = function()
        local mason = require("mason")
        mason.setup({
            PATH = "prepend"
        })

        local lsp = require("mason-lspconfig")
        lsp.setup({
            ensure_installed = { "lua_ls", "pyright", "solargraph", "clangd", "ts_ls" },
        })

        local java = require('java')
        java.setup()

        local lspc = require("lspconfig")
        lspc.jdtls.setup({})
        lspc.lua_ls.setup({})


        require ('mason-nvim-lint').setup({
            ensure_installed = { "flake8", "rubocop", "eslint_d", "checkstyle", "luacheck" },
            ignore_install = { "ruby", "inko", "janet", "clj-kondo" }
        })
    end
}

