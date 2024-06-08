local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local keymap = vim.keymap.set

local defaults = augroup("Defaults", {})

autocmd("BufWritePre", {
  pattern = { "*.tf", "*.tfvars" },
  callback = function()
    vim.lsp.buf.format()
  end,
})

autocmd("FileType", {
  desc = "Disable newline comments when inserting lines with o/O",
  group = defaults,
  pattern = { "*" },
  callback = function()
    vim.opt_local.formatoptions:remove("o")
  end,
})

autocmd("FileType", {
  pattern = "TelescopePrompt",
  callback = function()
    vim.opt_local.paste = false
  end,
})

autocmd("Termopen", {
  desc = "Unclutter terminal",
  group = defaults,
  pattern = { "*" },
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
  end,
})

autocmd("FileType", {
  desc = "Enable spellchecker",
  group = defaults,
  pattern = { "gitcommit", "tex", "NeogitCommitMessage" },
  callback = function()
    vim.opt_local.spell = true
  end,
})

autocmd("FileType", {
  desc = "Disable foldcolumn",
  group = defaults,
  pattern = {
    "neotest-summary",
    "dap-repl",
    "NeogitCommitMessage",
    "NeogitCommitView",
    "NeogitPopup",
    "NeogitStatus",
  },
  callback = function()
    vim.opt_local.foldcolumn = "0"
  end,
})

autocmd("LspAttach", {
  desc = "LSP",
  group = augroup("lsp", { clear = false }),
  callback = function(ev)
    local lsp = vim.lsp

    -- Lenses
    autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
      buffer = ev.buf,
      group = augroup("codelens", { clear = false }),
      callback = function()
        lsp.codelens.refresh()
      end,
    })

    -- Mappings
    local bufopts = { noremap = true, silent = true, buffer = ev.buf }
    keymap({ "n", "i" }, "<C-h>", lsp.buf.signature_help, bufopts)

    keymap("n", "<A-h>", function()
      lsp.inlay_hint(0, nil)
    end, bufopts)

    keymap({ "n", "v" }, "<leader>la", lsp.buf.code_action, bufopts)
    keymap("n", "<leader>lr", lsp.buf.rename, bufopts)
    keymap("n", "<leader>ll", lsp.codelens.run, bufopts)

    keymap("n", "gD", vim.lsp.buf.declaration, bufopts)
    keymap("n", "gd", vim.lsp.buf.definition, bufopts)
    keymap("n", "K", vim.lsp.buf.hover, bufopts)
    keymap("n", "gi", vim.lsp.buf.implementation, bufopts)
    keymap("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  end,
})

autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = augroup("highlight_yank", {}),
  callback = function()
    vim.highlight.on_yank()
  end,
})
