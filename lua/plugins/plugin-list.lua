local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'ellisonleao/gruvbox.nvim'
    use 'tpope/vim-surround'
    use 'neovim/nvim-lspconfig'
    use 'simrat39/rust-tools.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'nvim-treesitter/nvim-treesitter'
    use 'windwp/nvim-autopairs'
    use 'tpope/vim-fugitive'
    use 'numToStr/Comment.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'L3MON4D3/luasnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'folke/which-key.nvim'
    use 'goldfeld/vim-seek'
    use 'phaazon/hop.nvim'
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        }
    }
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    -- Automatically set up your configuration after cloning packer.nvim
    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)
