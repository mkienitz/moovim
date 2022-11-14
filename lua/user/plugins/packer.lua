local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

return require("packer").startup(function(use)
	-- General
	use("wbthomason/packer.nvim")
	use("ellisonleao/gruvbox.nvim")
	use("nvim-lua/plenary.nvim")
	-- Lsp, completion, snippets
	use("neovim/nvim-lspconfig")
	use("jose-elias-alvarez/null-ls.nvim")
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/luasnip")
	-- use("saadparwaiz1/cmp_luasnip")
	use("nvim-treesitter/nvim-treesitter")
	use("folke/trouble.nvim")
	-- Editing
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("numToStr/Comment.nvim")
	use("ggandor/leap.nvim")
	-- Other
	use("lewis6991/gitsigns.nvim")
	use("folke/which-key.nvim")
	use("ThePrimeagen/vim-be-good")
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "make",
	})

	-- Automatically set up your configuration after cloning packer.nvim
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
