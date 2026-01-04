local bufnr = vim.api.nvim_get_current_buf()
vim.keymap.set(
  "n",
  "<leader>ca",
  function()
    vim.cmd.RustLsp('codeAction') -- supports rust-analyzer's grouping
    -- or vim.lsp.buf.codeAction() if you don't want grouping.
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  "n",
  "K",  -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
  function()
    vim.cmd.RustLsp({'hover', 'actions'})
  end,
  { silent = true, buffer = bufnr }
)
vim.keymap.set(
  'n',
  '<leader>f',
  function()
    vim.lsp.buf.format()
  end,
  { buffer = bufnr, desc = 'Format buffer with LSP' }
)
-- Create a command `:Format` local to the LSP buffer
vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
  vim.lsp.buf.format()
end, { desc = 'Format current buffer with LSP' })
