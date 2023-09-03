return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function()
		local null_ls = require("null-ls")
		local code_actions = null_ls.builtins.code_actions
		local formatting = null_ls.builtins.formatting
		-- local hover = null_ls.builtins.hover
		-- local completion = null_ls.builtins.completion
		-- local diagnostics = null_ls.builtins.diagnostics
		return {
			sources = {
				formatting.prettier,
				formatting.stylua,
				formatting.autopep8,
				formatting.clang_format,
				formatting.stylish_haskell,
				formatting.rustfmt,
				formatting.prismaFmt,
				formatting.ocamlformat,
				code_actions.gitsigns,
			},
		}
	end,
}
