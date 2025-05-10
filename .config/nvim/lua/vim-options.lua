vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.swapfile = false
vim.opt.nu = true
vim.opt.rnu = true

vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cursorline = true

vim.opt.scrolloff = 8

vim.opt.guicursor = {
  "n-v-c:block",                                  -- Normal, visual, command-line: block cursor
  "i-ci-ve:ver25",                                -- Insert, command-line insert, visual-exclude: vertical bar cursor with 25% width
  "r-cr:hor20",                                   -- Replace, command-line replace: horizontal bar cursor with 20% height
  "o:hor50",                                      -- Operator-pending: horizontal bar cursor with 50% height
  "a:blinkwait700-blinkoff400-blinkon250",        -- All modes: blinking settings
  "sm:block-blinkwait175-blinkoff150-blinkon175", -- Showmatch: block cursor with specific blinking settings
}

vim.keymap.set("n", "<a-k>", ":wincmd k<CR>")
vim.keymap.set("n", "<a-j>", ":wincmd j<CR>")
vim.keymap.set("n", "<a-h>", ":wincmd h<CR>")
vim.keymap.set("n", "<a-l>", ":wincmd l<CR>")

-- Splits
vim.keymap.set("n", "<c-v>", ":vsplit<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<c-s>", ":split<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>")

vim.keymap.set("n", "<Leader>w", "<cmd>w<CR>")
vim.keymap.set("n", "<Leader>q", "<cmd>q<CR>")
vim.keymap.set("n", "<Leader>z", "<cmd>wq<CR>")

-- Press 'S' for quick find/replace for the word under the cursor
vim.keymap.set("n", "S", function()
  local cmd = ":%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>"
  local keys = vim.api.nvim_replace_termcodes(cmd, true, false, true)
  vim.api.nvim_feedkeys(keys, "n", false)
end)

-- Open spectre for global find/replace
vim.keymap.set("n", "<leader>S", function()
  require("spectre").toggle()
end)
