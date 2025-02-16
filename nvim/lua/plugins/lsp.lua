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
            ensure_installed = { "lua_ls", "pyright", "solargraph", "clangd", "ts_ls", "bashls" },
        })

        local java = require('java')
        java.setup()

        local lspc = require("lspconfig")
        lspc.jdtls.setup({})
        lspc.lua_ls.setup({})
        lspc.pyright.setup({})
        lspc.solargraph.setup({})
        lspc.clangd.setup({})
        lspc.ts_ls.setup({})
        lspc.bashls.setup({})


        -- ~~~ Linters ~~~
        require('lint').linters_by_ft = {
            java = {'checkstyle'},
            lua = {'luacheck'},
            python = {'flake8'},
            ruby = {'rubocop'},
            c_cpp = {'cpplint'},
            cpp = {'cpplint'},
            c = {'cpplint'},
            typescript = {'eslint_d'},
            javascript = {'eslint_d'},
            typescriptreact = {'eslint_d'},
            javascriptreact = {'eslint_d'},
            bash = {'shellcheck'},
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
            ignore_install = { "ruby", "inko", "janet", "clj-kondo" }
        })
    end
}

