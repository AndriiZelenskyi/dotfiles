return {
	"MunifTanjim/eslint.nvim",
	dependencies = {
		"jose-elias-alvarez/null-ls.nvim",
		"neovim/nvim-lspconfig",
	},
	enable = false,
	config = function()
		local null_ls = require("null-ls")
		local eslint = require("eslint")

		null_ls.setup()

		eslint.setup({
			bin = "eslint_d", -- or `eslint_d`
			code_actions = {
				enable = true,
				disable_rule_comment = {
					enable = true,
					location = "separate_line", -- or `same_line`
				},
			},
			diagnostics = {
				enable = true,
				report_unused_disable_directives = false,
				run_on = "type", -- or `save`
			},
		})
	end,
}
