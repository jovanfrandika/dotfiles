return {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  dependencies = {
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "folke/noice.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  opts = function()
    local actions = require("telescope.actions")
    local fb_actions = require("telescope").extensions.file_browser.actions
    local additional_rg_args = { "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*" }

    return {
      defaults = {
        theme = "center",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        file_ignore_patterns = {
          "^.git/*",
          "node_modules/*",
          ".mypy_cache/*",
        },
        mappings = {
          i = {
            ["<Tab>"] = actions.move_selection_next,
            ["<S-Tab>"] = actions.move_selection_previous,
            ["<C-n>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<C-p>"] = actions.toggle_selection + actions.move_selection_better,
          },
        },
      },
      pickers = {
        buffers = {
          mappings = {
            i = {
              ["<S-BS>"] = actions.delete_buffer,
            },
          },
        },
        lsp_references = {
          show_line = false,
        },
        find_files = {
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        live_grep = {
          additional_args = additional_args,
        },
        grep_string = {
          additional_args = additional_args,
        },
      },
      extensions = {
        file_browser = {
          hidden = true,
          hijack_netrw = true,
          grouped = true,
          select_buffer = true,
          sorting_strategy = "ascending",
          initial_mode = "normal",
          default_selection_index = 2,
          mappings = {
            i = {
              ["<C-h>"] = fb_actions.goto_parent_dir,
              ["<C-l>"] = actions.select_default,
              ["<C-H>"] = fb_actions.toggle_hidden,
            },
            n = {
              ["h"] = fb_actions.goto_parent_dir,
              ["m"] = fb_actions.move,
              ["y"] = fb_actions.copy,
              ["l"] = actions.select_default,
              ["H"] = fb_actions.toggle_hidden,
              ["N"] = fb_actions.create,
            },
          },
        },
      },
    }
  end,
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("fzf")
    telescope.load_extension("noice")
    telescope.load_extension("file_browser")
  end,
  keys = {
    { "<leader>ff", "<CMD>Telescope find_files<CR>", noremap = true },
    { "<leader>fg", "<CMD>Telescope live_grep<CR>", noremap = true },
    { "<leader>fp", "<CMD>Telescope project<CR>", noremap = true },
  },
}
