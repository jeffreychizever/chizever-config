return {
    'iamcco/markdown-preview.nvim',
    cmd = {'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle'},
    ft = {'markdown'},
    build = 'cd app && npm install @chemzqm/neovim tslib && npm install && git restore .',
    init = function()
        -- Enhanced logging
        vim.g.mkdp_log_level = 'debug'
        
        -- Browser settings
        vim.g.mkdp_auto_start = 0
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_refresh_slow = 0
        
        -- Set to true to help debug connectivity issues
        vim.g.mkdp_open_to_the_world = 1
        
        -- Try to specify a browser explicitly if available
        vim.g.mkdp_browser = 'firefox'  -- Try with firefox, chrome, or brave
        
        -- Port configuration
        vim.g.mkdp_port = '8090'  -- Use a specific port
        
        -- Always echo URL
        vim.g.mkdp_echo_preview_url = 1
        vim.g.mkdp_page_title = '${name}'
        
        -- Command to open browser URL manually
        vim.g.mkdp_open_ip = '127.0.0.1'
        
        -- Command hook for debugging
        vim.g.mkdp_browserfunc = 'g:OpenMarkdownPreview'
    end,
    config = function()
        -- Debug function to open URL
        vim.cmd([[
        function! g:OpenMarkdownPreview(url)
          echo "Markdown Preview URL: " . a:url
          " Uncomment below if needed to manually open the URL
          " call system('xdg-open ' . a:url)
        endfunction
        ]])
        
        -- Command to show the current preview URL
        vim.api.nvim_create_user_command('MarkdownPreviewDebug', function()
            vim.cmd('echo "Preview server status:"')
            vim.cmd('echo g:mkdp_port')
            vim.cmd('echo g:mkdp_open_ip')
            vim.cmd('echo "Try opening http://127.0.0.1:" . g:mkdp_port')
        end, {})
        
        -- Keymaps
        vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { desc = 'Toggle Markdown Preview' })
        vim.keymap.set('n', '<leader>md', '<cmd>MarkdownPreviewDebug<CR>', { desc = 'Markdown Preview Debug Info' })
    end
}
