return {
    "laytan/cloak.nvim",
    config = function()
        require('cloak').setup({
            cloak_length = 7,
            cloak_telescope = false,
            patterns = {
                {
                    file_pattern = '.env*',
                    cloak_pattern = '=.+',
                    replace = nil,
                },
            },
        })
    end,
}
