local keymap = vim.keymap.set

keymap("n", "tl", "<CMD>tablast<CR>")
keymap("n", "<Tab>", "<CMD>tabnext<CR>")
keymap("n", "<S-Tab>", "<CMD>tabprevious<CR>")
keymap("n", "tn", "<CMD>tab split<CR>")

local opts = { noremap = true }
keymap("n", "sf", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", opts)

keymap("n", "<leader>tt", "<CMD>NvimTreeToggle<CR>", opts)

keymap("n", "<leader>gg", "<CMD>Neogit<CR>", opts)
keymap("n", "<leader>gc", "<CMD>Neogit commit<CR>", opts)

keymap("n", "<leader>xx", "<CMD>TroubleToggle<CR>", opts)
keymap("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>", opts)
keymap("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>", opts)
keymap("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>", opts)
-- keymap("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>", opts)
-- keymap("n", "gR", "<CMD>TroubleToggle lsp_references<CR>")