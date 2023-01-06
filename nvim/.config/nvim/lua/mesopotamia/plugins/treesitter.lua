local setup = function()
  require("nvim-treesitter.configs").setup({
    playground = { enable = false },
    query_linter = {
      enable = true,
      use_virtual_text = true,
      lint_events = { "BufWrite", "CursorHold" },
    },
    ensure_installed = "all",
    highlight = {
      enable = true,
      --disable = { "scala" },
    },
  })
end

return {
  setup = setup,
}

