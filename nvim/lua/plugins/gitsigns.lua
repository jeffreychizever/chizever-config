return {
    'lewis6991/gitsigns.nvim',
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup()
        gitsigns.toggle_current_line_blame()
        gitsigns.toggle_numhl()
        local next_hunk = function()
            gitsigns.next_hunk()
            gitsigns.preview_hunk()
        end
        vim.keymap.set('n', '<leader>gb', gitsigns.blame, { desc = 'Git blame' })
        vim.keymap.set('n', '<leader>gn', next_hunk, { desc = 'Git goto next hunk' })
        vim.keymap.set('n', '<leader>gN', gitsigns.prev_hunk, { desc = 'Git goto prev hunk' })
        vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git reset hunk' })
        vim.keymap.set('n', '<leader>gs', gitsigns.preview_hunk, { desc = 'Git show hunk' })
        vim.keymap.set('n', '<leader>ga', gitsigns.stage_buffer, { desc = 'Git add' })

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>gf', builtin.git_status, { desc = 'Find staged changes' })
    end
}
