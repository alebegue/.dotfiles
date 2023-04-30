return {
    "hrsh7th/nvim-cmp",
    cmd = "CmpStatus",
    config = function()
        local cmp = require("cmp")

        require("luasnip.loaders.from_vscode").lazy_load()

        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<C-c>"] = cmp.mapping.abort(),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
                ["<C-j>"] = cmp.mapping(function(fallback)
                    local luasnip = require("luasnip")

                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    elseif cmp.visible() and has_words_before() then
                        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                    else
                        fallback()
                    end
                end),
                ["<C-k>"] = cmp.mapping(function(fallback)
                    local luasnip = require("luasnip")

                    if luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    elseif cmp.visible() and has_words_before() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end),
            }),
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "buffer" },
                { name = "path" },
            }),
        })
    end,
    dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        { "L3MON4D3/LuaSnip" },
        { "saadparwaiz1/cmp_luasnip" },
        { "rafamadriz/friendly-snippets" },
        { "hrsh7th/cmp-path" },
    },
}
