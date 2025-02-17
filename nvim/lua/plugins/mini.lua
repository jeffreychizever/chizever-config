return {
    'echasnovski/mini.completion',
    version = false,
    config = function()
        require('mini.completion').setup({
            window = {
                info = { height = 25, width = 80, border = 'rounded' },
                signature = { height = 25, width = 80, border = 'rounded' },
            },
        })
    end
}
