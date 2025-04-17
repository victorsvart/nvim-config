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
