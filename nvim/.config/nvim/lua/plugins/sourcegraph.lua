return {
    "sourcegraph/sg.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("sg").setup({})

        vim.keymap.set('n', '<leader>cs', require('sg.extensions.telescope').fuzzy_search_results, { noremap = true, desc = 'cody search' })
        vim.keymap.set('n', '<leader>cc', [[<cmd>CodyToggle<CR>]], { noremap = true, desc = 'CodyChat' })
        vim.keymap.set('v', '<leader>cc', [[:CodyAsk ]], { noremap = true, desc = 'CodyAsk' })
    end,
}
