return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    --vim.keymap.set('n', '<leader>b', ':Neotree filesystem reveal right<CR>', {})
    vim.keymap.set("n", "<leader>b", ":Neotree toggle reveal right<CR>", {})
    -- Set the 'show_hidden' option to true to display hidden files
    require("neo-tree").setup({
      filesystem = {
        filtered_items = {
          visible = true,   -- Show hidden files
          hide_dotfiles = false, -- Disable hiding dotfiles
        },
      },
    })
  end,
}
