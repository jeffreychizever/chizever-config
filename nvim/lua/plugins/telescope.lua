return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'smartpde/telescope-recent-files',
        'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
        -- Configure telescope
        require('telescope').setup({
            defaults = {
                path_display = { "shorten" },
            },
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown {}
                }
            }
        })

        -- Load extensions
        require('telescope').load_extension('recent_files')
        require('telescope').load_extension('ui-select')

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', function()
            builtin.find_files({
                cwd = vim.fs.root(0, {
                    '.git',
                }) or vim.env.PWD
            })
        end, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live grep' })
        vim.keymap.set('n', '<leader>f*', builtin.grep_string, { desc = 'Grep string' })
        vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffers' })
        vim.keymap.set("n", "<leader>ft", "<cmd>Tele<CR>", { desc = "Telescope" })
        vim.keymap.set('n', '<leader>fr', function() require('telescope').extensions.recent_files.pick() end, { desc = 'Recent files' })
    end
}
