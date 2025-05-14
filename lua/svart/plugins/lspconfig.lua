return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local nvim_lsp = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")

    -- Função de attach para formatação automática ao salvar
    local on_attach = function(client, bufnr)
      if client.server_capabilities.documentFormattingProvider then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = vim.api.nvim_create_augroup("Format", { clear = true }),
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format()
          end,
        })
      end
    end

    -- Definindo as capacidades do LSP, incluindo auto-complete via nvim-cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Configuração do LSP com os handlers
    mason_lspconfig.setup_handlers({
      -- Configuração padrão para servidores LSP
      function(server)
        nvim_lsp[server].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,

      -- Configuração específica para o servidor 'lua_ls' (Lua Language Server)
      ["lua_ls"] = function()
        nvim_lsp["lua_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" }, -- Definindo 'vim' como uma global reconhecida
              },
            },
          },
        })
      end,

      -- Configurações para outros servidores LSP
      ["gopls"] = function()
        nvim_lsp["gopls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["ts_ls"] = function()
        nvim_lsp["ts_ls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["eslint"] = function()
        nvim_lsp["eslint"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["basedpyright"] = function()
        nvim_lsp["basedpyright"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["dockerls"] = function()
        nvim_lsp["dockerls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["docker_compose_language_service"] = function()
        nvim_lsp["docker_compose_language_service"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["jsonls"] = function()
        nvim_lsp["jsonls"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
      ["emmet_language_server"] = function()
        nvim_lsp["emmet_language_server"].setup({
          on_attach = on_attach,
          capabilities = capabilities,
        })
      end,
    })
  end,
}
