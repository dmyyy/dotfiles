return {
  {
    "saghen/blink.cmp",
    build = "cargo +nightly build --release",
    opts = {
      keymap = {
        -- Disable autocomplete on Enter
        ["<CR>"] = {},
      },
    },
  },
}
