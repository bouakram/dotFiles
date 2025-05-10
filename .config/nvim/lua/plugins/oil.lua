return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type oil.SetupOpts
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require('oil').setup {
      columns = { "icon" },
      keymaps = {
        ["<C-h>"] = false,
        ["<M-h>"] = "actions.select_split",
      },
      view_options = {
        show_hidden = true,
      },
    }

    -- Open parent directory in current window
    -- vim.keymap.set("n", "-", "<cmd>Oil<CR>", { desc = "Open parent directory" })

    -- Open parent directory in floating window
    vim.keymap.set("n", "-", require('oil').toggle_float)
  end
}
