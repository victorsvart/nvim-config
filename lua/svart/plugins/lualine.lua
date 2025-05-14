return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = {
      bg = "#202328",
      fg = "#bbc2cf",
      yellow = "#ECBE7B",
      green = "#98be65",
      blue = "#51afef",
      red = "#ec5f67",
      violet = "#a9a1e1",
    }

    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = "poimandres",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { "filename", "filesize", "location", "diagnostics" },
        lualine_x = { "encoding", "fileformat", "diff", "lsp" },
        lualine_y = {},
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
    }

    -- Language icon and name component
    local function language_icon()
      local filetype = vim.bo.filetype
      local file_extension = vim.fn.expand("%:e")
      local icons = {
        lua = "",
        python = "",
        javascript = "",
        typescript = "",
        tsx = "",
        jsx = "",
        html = "",
        css = "",
        go = "",
        csharp = "",
        java = "",
      }
      local lang_names = {
        lua = "Lua",
        python = "Python",
        javascript = "JavaScript",
        typescript = "TypeScript",
        tsx = "TypeScript (TSX)",
        jsx = "JavaScript (JSX)",
        html = "HTML",
        css = "CSS",
        go = "Go",
        csharp = "C#",
        java = "Java",
      }

      -- check for 'tsx' or 'jsx' extensions because of emmet | dumb solution
      if file_extension == "tsx" then
        return icons.tsx .. " " .. lang_names.tsx
      elseif file_extension == "jsx" then
        return icons.jsx .. " " .. lang_names.jsx
      end

      local icon = icons[filetype] or ""
      local lang_name = lang_names[filetype] or "unknown || unloaded"

      return icon .. " " .. lang_name
    end

    table.insert(
      config.sections.lualine_c,
      { language_icon, color = { fg = colors.blue }, padding = { right = 1 } }
    )

    require("lualine").setup(config)
  end,
}
