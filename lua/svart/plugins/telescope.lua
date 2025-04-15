return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  extensions = {
    file_browser = {
      theme = "ivy",
      hijack_netrw = true,
    },
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup()

    local keymap = vim.keymap

    -- Helper to find the git root
    local function find_git_root()
      -- Get the path to the directory of the current buffer
      local filepath = vim.api.nvim_buf_get_name(0)
      local directory = vim.fn.fnamemodify(filepath, ":p:h")

      -- Traverse upwards to find .git
      local git_root = vim.fs.find(".git", { upward = true, path = directory })[1]
      if git_root then
        return vim.fn.fnamemodify(git_root, ":h") -- Get parent directory of .git
      else
        return vim.loop.cwd()                 -- fallback
      end
    end

    keymap.set("n", "<leader>ff", function()
      require("telescope.builtin").find_files({
        cwd = find_git_root(),
      })
    end, { desc = "Fuzzy find files in git root" })

    keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope git_status<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope git_commits<cr>", { desc = "Find todos" })
  end,
}
