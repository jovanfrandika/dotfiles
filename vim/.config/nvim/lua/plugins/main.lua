return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "folke/trouble.nvim",
    opts = { use_diagnostic_signs = true },
  },
  { "tpope/vim-commentary" },
  {
    "RRethy/vim-illuminate",
    event = "LspAttach",
    config = function() require("illuminate").configure({ providers = { "lsp" } }) end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = { check_ts = true, ignored_next_char = "" },
  },
  {
    'akinsho/bufferline.nvim',
    config = function()
      require('bufferline').setup({
        options = {
          mode = "tabs",
        },
      })
    end
  },
  { 'nvim-tree/nvim-tree.lua', config = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
}