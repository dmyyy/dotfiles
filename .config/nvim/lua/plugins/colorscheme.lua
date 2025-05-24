return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
      -- colorscheme = "tokyonight",
    },
  },

  {
    -- choose a different one based on the time of da
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").setup({
        dimInactive = true, -- Dim inactive window (optional)

        -- removes gutter theming
        -- colors = {
        --   theme = {
        --     all = {
        --       ui = {
        --         bg_gutter = "none",
        --       },
        --     },
        --   },
        -- },

        -- for late night coding sessions
        -- theme = "dragon",
      })

      vim.cmd("colorscheme kanagawa")
    end,
  },
}
