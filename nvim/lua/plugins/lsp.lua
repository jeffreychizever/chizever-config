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
        lsp.setup({ ensure_installed = {
            "lua_ls",
            "pyright",
            "solargraph",
            "clangd",
            "ts_ls",
            "bashls",
            "harper_ls",
            "marksman",
            "jsonls"
        }})

        local java = require('java')
        java.setup()

        local lspc = require("lspconfig")
        lspc.jdtls.setup({})
        lspc.lua_ls.setup({
            -- Stop the lua lsp complaining about calling `vim`
            settings = { Lua = { diagnostics = { globals = { "vim" },},},},
        })
        lspc.pyright.setup({})
        lspc.solargraph.setup({})
        lspc.clangd.setup({})
        lspc.ts_ls.setup({})
        lspc.bashls.setup({})
        lspc.harper_ls.setup({})
        lspc.marksman.setup({})

        -- ~~~ Linters ~~~
        local lint = require('lint')
        lint.linters_by_ft = {
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

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>vi', builtin.lsp_implementations, { desc = 'View implementation(s)' })
        vim.keymap.set('n', '<leader>vd', builtin.lsp_definitions, { desc = 'View definition(s)' })
        vim.keymap.set('n', '<leader>vt', builtin.lsp_type_definitions, { desc = 'View type definition(s)' })
        vim.keymap.set('n', '<leader>vu', builtin.lsp_incoming_calls, { desc = 'View usage(s)' })
        vim.keymap.set('n', '<leader>vr', builtin.lsp_references, { desc = 'View reference(s)' })
        vim.keymap.set('n', '<leader>vs', builtin.lsp_workspace_symbols, { desc = 'View symbols' })
        vim.keymap.set('n', '<leader>va', vim.lsp.buf.code_action, { desc = 'View action(s)' })
        vim.keymap.set('n', '<leader>ve', builtin.diagnostics, { desc = 'View error(s)' })

        vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave", "BufWritePost" }, {
        callback = function()
                local lint_status, linter = pcall(require, "lint")
                if lint_status then
                    linter.try_lint()
                end
            end,
        })

        require ('mason-nvim-lint').setup({
            ignore_install = { "ruby", "inko", "janet", "clj-kondo" }
        })
    end
}

