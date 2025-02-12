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
    end
}
