return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()

		require("mason-lspconfig").setup({
			automatic_installation = true,
			ensure_installed = {
				"gopls",
				"basedpyright",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"emmet-language-server",
				"goimports",
				"json-lsp",
				"lua-language-server",
				"prettier",
				"pylint",
				"stylua",
				"typescript-language-server",
			},
		})

		require("mason-tool-installer").setup({
			ensure_installed = {
				"stylua",
				"pylint",
			},
		})
	end,
}
