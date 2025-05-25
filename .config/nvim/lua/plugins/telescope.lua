return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    ---@diagnostic disable-next-line: unused-local
    local builtin = require("telescope.builtin")
    -- First, make sure Telescope is loaded
    ---@diagnostic disable-next-line: unused-local
    local telescope = require("telescope")

    -- Set up the keymap for opening Telescope with custom options
    vim.keymap.set(
      "n",
      "<leader>ff",
      "<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--ignore', '--hidden', '--files'}, prompt_prefix = '🔍' })<CR>",
      { noremap = true, silent = true }
    )
    vim.keymap.set(
      "n",
      "<leader>fg",
      "<cmd>lua require('telescope.builtin').live_grep({prompt_prefix = '🔍' })<CR>",
      {}
    )
    vim.keymap.set(
      "n",
      "<leader>fh",
      "<cmd>lua require('telescope.builtin').help_tags()<CR>",
      {}
    )
  end,
  -- {
  -- "nvim-telescope/telescope-ui-select.nvim",
  -- dependencies = { "nvim-telescope/telescope.nvim" },
  -- config = function()
  --   require("telescope").setup({
  --     extensions = {
  --       ["ui-select"] = {
  --         require("telescope.themes").get_dropdown()
  --       },
  --     },
  --   })
  --   require("telescope").load_extension("ui-select")
  --   vim.keymap.set(
  --     "n",
  --     "<leader>ff",
  --     "<cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--ignore', '--hidden', '--files'}, prompt_prefix = '🔍' })<CR>",
  --     { noremap = true, silent = true }
  --   )
  --   vim.keymap.set(
  --     "n",
  --     "<leader>fg",
  --     "<cmd>lua require('telescope.builtin').live_grep({prompt_prefix = '🔍' })<CR>",
  --     {}
  --   )
  --   vim.keymap.set(
  --     "n",
  --     "<leader>fh",
  --     "<cmd>lua require('telescope.builtin').help_tags()<CR>",
  --     {}
  --   )
  -- end,
  -- },
}
