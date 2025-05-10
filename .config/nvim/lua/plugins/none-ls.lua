return {
  "nvimtools/none-ls.nvim",
  config = function()
    local async_formatting = function(bufnr)
      bufnr = bufnr or vim.api.nvim_get_current_buf()

      vim.lsp.buf_request(
        bufnr,
        "textDocument/formatting",
        vim.lsp.util.make_formatting_params({}),
        function(err, res, ctx)
          if err then
            local err_msg = type(err) == "string" and err or err.message
            -- you can modify the log message / level (or ignore it completely)
            vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
            return
          end

          -- don't apply results if buffer is unloaded or has been modified
          if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
            return
          end

          if res then
            local client = vim.lsp.get_client_by_id(ctx.client_id)
            vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
            vim.api.nvim_buf_call(bufnr, function()
              vim.cmd("silent noautocmd update")
            end)
          end
        end
      )
    end

    local null_ls = require("null-ls")
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    null_ls.setup({
      sources = {
        -- formating
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.luasnip,
        null_ls.builtins.formatting.forge_fmt,
        null_ls.builtins.formatting.prettierd,
        null_ls.builtins.formatting.nginx_beautifier,
        null_ls.builtins.formatting.pg_format,
        null_ls.builtins.formatting.prisma_format,
        null_ls.builtins.formatting.rustywind,
        null_ls.builtins.formatting.dxfmt,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.formatting.clang_format,
        -- diagnostics
        null_ls.builtins.diagnostics.checkmake,
        null_ls.builtins.diagnostics.markuplint,
        null_ls.builtins.diagnostics.dotenv_linter,
        null_ls.builtins.diagnostics.markdownlint,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.spectral,
        null_ls.builtins.diagnostics.solhint,
        null_ls.builtins.diagnostics.hadolint,
        null_ls.builtins.diagnostics.stylelint,
        --null_ls.builtins.diagnostics.eslint,
        -- completion
        null_ls.builtins.completion.spell,
        null_ls.builtins.completion.luasnip,
        --null_ls.builtins.completion.tags,
        --null_ls.builtins.completion.vsnip,
        -- code actions
        null_ls.builtins.code_actions.refactoring,
      },
      debug = false,
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
          vim.api.nvim_create_autocmd("BufWritePost", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              async_formatting(bufnr)
            end,
          })
        end
      end,
    })

    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
