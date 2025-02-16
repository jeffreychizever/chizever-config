return {
    'nvim-treesitter/nvim-treesitter',
    config = function()
        require('nvim-treesitter.configs').setup({
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "bash", "c", "css", "html", "diff",
                "gitcommit", "java", "javascript",
                "jq", "json", "latex",
                "lua", "python", "regex",
                "ruby", "sql", "typescript",
                "markdown", "markdown_inline"
            }
        })

        -- use Treesitter for folding
        vim.opt.foldcolumn = "0"
        vim.opt.foldmethod = "expr"
        vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.opt.foldtext = ""

        vim.opt.foldnestmax = 4
        vim.opt.foldlevel = 99
        vim.opt.foldlevelstart = 99

    end
}
