return {
    'lewis6991/gitsigns.nvim',
    config = function()
        local gitsigns = require('gitsigns')
        gitsigns.setup()
        gitsigns.toggle_current_line_blame()
        gitsigns.toggle_numhl()
        vim.keymap.set('n', '<leader>gb', gitsigns.blame, { desc = 'Git blame' })
        vim.keymap.set('n', '<leader>gn', gitsigns.next_hunk, { desc = 'Git goto next hunk' })
        vim.keymap.set('n', '<leader>gn', gitsigns.prev_hunk, { desc = 'Git goto prev hunk' })
        vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, { desc = 'Git reset hunk' })
        vim.keymap.set('n', '<leader>gs', gitsigns.preview_hunk, { desc = 'Git show hunk' })
        vim.keymap.set('n', '<leader>gf', gitsigns.setqflist, { desc = 'Git find hunks' })
    end
}
