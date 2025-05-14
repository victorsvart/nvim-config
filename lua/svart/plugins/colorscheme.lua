return {
  "olivercederborg/poimandres.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("poimandres").setup({
      -- bold_vert_split = false,
      -- dim_nc_background = false,
      disable_background = true,
      -- disable_float_background = false,
      disable_italics = true,
    })

    vim.cmd("colorscheme poimandres")
    vim.api.nvim_set_hl(0, "@function", { fg = "#5de4c7" }) -- teal green
  end,
}
