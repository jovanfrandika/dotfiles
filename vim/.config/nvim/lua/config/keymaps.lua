local keymap = vim.keymap.set
local str = string.format

local bufopts = { noremap=true, silent=true, buffer=bufnr }

vim.g.mapleader = "\\"

keymap("n", "tl", "<CMD>tablast<CR>")
keymap("n", "<Tab>", "<CMD>tabnext<CR>")
keymap("n", "<S-Tab>", "<CMD>tabprevious<CR>")
keymap("n", "tn", "<CMD>tab split<CR>")

keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
keymap('n', 'K', vim.lsp.buf.hover, bufopts)
keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
keymap('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)

keymap("n", "sf", "<CMD>Telescope file_browser path=%:p:h select_buffer=true<CR>", { noremap = true })
keymap("n", "<leader>xx", "<CMD>TroubleToggle<CR>")
keymap("n", "<leader>xw", "<CMD>TroubleToggle workspace_diagnostics<CR>")
keymap("n", "<leader>xd", "<CMD>TroubleToggle document_diagnostics<CR>")
keymap("n", "<leader>xq", "<CMD>TroubleToggle quickfix<CR>")
keymap("n", "<leader>xl", "<CMD>TroubleToggle loclist<CR>")
keymap("n", "gR", "<CMD>TroubleToggle lsp_references<CR>")

-- keymap('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- keymap('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- keymap('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
-- keymap('n', '<space>rn', vim.lsp.buf.rename, bufopts)
-- keymap('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
-- keymap('n', 'gr', vim.lsp.buf.references, bufopts)
-- keymap('n', '<space>f', vim.lsp.buf.formatting, bufopts)