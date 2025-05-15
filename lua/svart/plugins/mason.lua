return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    require("mason").setup()

    -- LSP servers (usam nomes do lspconfig)
    require("mason-lspconfig").setup({
      automatic_installation = true,
      ensure_installed = {
        "gopls",
        "basedpyright",
        "docker_compose_language_service",
        "dockerls",
        "emmet_language_server",
        "jsonls",
        "lua_ls",
        "ts_ls",
      },
    })

    -- Ferramentas (formatadores e linters, usam nomes do mason registry)
    require("mason-tool-installer").setup({
      ensure_installed = {
        "goimports",
        "prettier",
        "pylint",
        "stylua",
      },
    })
  end,
}
