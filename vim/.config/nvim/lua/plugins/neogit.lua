return {
  "NeogitOrg/neogit",
  dependencies = {
      { "sindrets/diffview.nvim", cmd = { "DiffviewOpen", "DiffviewFileHistory" } },
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
  },
  cmd = "Neogit",
  config = true,
}