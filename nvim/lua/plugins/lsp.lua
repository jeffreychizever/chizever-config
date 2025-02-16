return {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
        "williamboman/mason.nvim", "neovim/nvim-lspconfig",
        "mfussenegger/nvim-lint", "rshkarin/mason-nvim-lint",
        "nvim-java/nvim-java"},
    config = function()

        -- ~~~ LSPs ~~~
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
        do end


        -- ~~~ Linters ~~~
        require('lint').linters_by_ft = {
            python = {'flake8'},
            ruby = {'rubocop'},
            java = {'checkstyle'},
            lua = {'luacheck'},
            typescript = {'eslint_d'},
            javascript = {'eslint_d'},
            typescriptreact = {'eslint_d'},
            javascriptreact = {'eslint_d'},
        }

        vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
        callback = function()
                local lint_status, lint = pcall(require, "lint")
                if lint_status then
                    lint.try_lint()
                end
            end,
        })

        require ('mason-nvim-lint').setup({
            ensure_installed = { "flake8", "rubocop", "eslint_d", "checkstyle", "luacheck" },
            ignore_install = { "ruby", "inko", "janet", "clj-kondo" }
        })
    end
}

