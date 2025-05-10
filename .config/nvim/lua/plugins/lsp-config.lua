return {
  {
    "williamboman/mason.nvim",
    version = "v1.8.0",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    version = "v1.21.0",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "vtsls", -- Changed from "vtsls" to correct server name
          "tailwindcss",
          "rust_analyzer",
          "bashls",
          "cssls",
          "dockerls",
          "graphql",
          "html",
          "clangd",
          "jsonls",
          "ast_grep",
          "remark_ls",
          "prismals",
          "pylyzer",
          "solidity",
          "sqlls",
          "yamlls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp" -- Added explicit dependency for capabilities
    },
    config = function()
      -- Ensure cmp_nvim_lsp is loaded before use
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      local lspconfig = require('lspconfig')

      -- Common setup function for all servers
      local function setup_server(server)
        lspconfig[server].setup({
          capabilities = capabilities
        })
      end

      -- Setup all servers
      local servers = {
        'lua_ls',
        'vtsls',
        'tailwindcss',
        'rust_analyzer',
        'bashls',
        'cssls',
        'html',
        'dockerls',
        'graphql',
        'clangd',
        'jsonls',
        'ast_grep',
        'remark_ls',
        'prismals',
        'pylyzer',
        'solidity',
        'sqlls',
        'yamlls',
      }

      for _, server in ipairs(servers) do
        setup_server(server)
      end

      -- Special configurations
      lspconfig.solidity.setup({
        capabilities = capabilities,
        filetypes = { "solidity" }
      })

      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client then
            vim.keymap.set("n", "H", vim.lsp.buf.hover, { buffer = args.buf })
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = args.buf })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = args.buf })
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = args.buf })
            vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = args.buf })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })
          end
        end,
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown()
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
