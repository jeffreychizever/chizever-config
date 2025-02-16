
return {
    'lewis6991/gitsigns.nvim',
    cmd = "Gitsigns",
    config = function() 
        local gitsigns = require('gitsigns').setup({
            current_line_blame = true
        })
    end
}
