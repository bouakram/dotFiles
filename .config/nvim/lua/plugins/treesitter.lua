return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "solidity",
        "rust",
        "css",
        "html",
        "typescript",
        "c",
        "java",
        "python",
        "dockerfile",
        "yaml",
        "go",
        "markdown_inline",
        "bash",
        "nginx",
        "sql",
        "json",
      },
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
