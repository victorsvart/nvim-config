vim.g.mapleader = " "

local function map(mode, lhs, rhs)
  vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
map("n", "<leader>q", "<CMD>q<CR>")

-- Exit insert mode
map("i", "jk", "<ESC>")

-- code actions
map("n", "<leader>ca", vim.lsp.buf.code_action)

-- go to definition
map("n", "gd", vim.lsp.buf.definition)

-- go to implementation
map("n", "gI", vim.lsp.buf.implementation)

-- rename
map("n", "<leader>ra", vim.lsp.buf.rename)
--
-- Open diagnostics in the location list
vim.keymap.set("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- telescope-file-browser
vim.keymap.set("n", "<leader>e", ":Telescope file_browser<CR>")

-- open file_browser with the path of the current buffer
--vim.keymap.set("n", "<space>fb", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")

-- New Windows
map("n", "<leader>o", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-j>", "<C-w>j")

-- Resize Windows
map("n", "<C-Left>", "<C-w><")
map("n", "<C-Right>", "<C-w>>")
map("n", "<C-Up>", "<C-w>+")
map("n", "<C-Down>", "<C-w>-")
