vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("sbdchd/neoformat")

    use("folke/tokyonight.nvim")

    use("kyazdani42/nvim-web-devicons")

    use("nvim-lualine/lualine.nvim", {
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    use("norcalli/nvim-colorizer.lua")

    use("nvim-lua/plenary.nvim")
    use("TimUntersberger/neogit")
    use("airblade/vim-gitgutter")
    use("nvim-telescope/telescope.nvim")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
    use("lewis6991/spellsitter.nvim")

    use("chrisbra/csv.vim")

    use("neovim/nvim-lspconfig")
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("tzachar/cmp-tabnine", { run = "./install.sh" })
    use("simrat39/rust-tools.nvim")
end)
