local fn = vim.fn
local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
    vim.cmd [[packadd packer.nvim]]
end

return require("packer").startup({function(use)
    use("wbthomason/packer.nvim")

    use("sbdchd/neoformat")
    use("tomtom/tcomment_vim")

    use("folke/tokyonight.nvim")

    use("kyazdani42/nvim-web-devicons")

    use("itchyny/lightline.vim")

    use("norcalli/nvim-colorizer.lua")

    use("nvim-lua/plenary.nvim")
    use("TimUntersberger/neogit")
    use("airblade/vim-gitgutter")
    use("nvim-telescope/telescope.nvim")

    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")

    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("windwp/nvim-autopairs")

    use("chrisbra/csv.vim")

    use("neovim/nvim-lspconfig")
    use({"glepnir/lspsaga.nvim", branch = "main"})
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/nvim-cmp")
    use("onsails/lspkind-nvim")
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")
    use("simrat39/rust-tools.nvim")

    use("github/copilot.vim")

    use("iamcco/markdown-preview.nvim")

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins

    if packer_bootstrap then
        require("packer").sync()
    end
end,
config = {
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "single" })
        end
    }
}})
