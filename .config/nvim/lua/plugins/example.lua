return {
  -- -- fast cursor move
  { "xiyaowong/fast-cursor-move.nvim" },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Comp <https://vi.stackexchange.com/questions/45454/cs-is-not-working-when-nvim-surround-is-installed-via-lazyvim>
        -- Test on 2024-09-01 - Added modifier `g` in front of the commands
        keymaps = {
          insert = "<C-g>s",
          insert_line = "<C-g>S",
          normal = "gys",
          normal_cur = "gyss",
          normal_line = "gyS",
          normal_cur_line = "gySS",
          visual = "S",
          visual_line = "gS",
          delete = "gds",
          change = "gcs",
          change_lineg = "gcS",
        },
      })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   keys = {
  --     -- add a keymap to browse plugin files
  --     -- stylua: ignore
  --     {
  --       "<leader>fg",
  --       function() require("telescope.builtin").live_grep() end,
  --       desc = "Live Grep",
  --     },
  --     {
  --       "<leader>fp",
  --       function()
  --         require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
  --       end,
  --       desc = "Find Plugin File",
  --     },
  --   },
  --   -- change some options
  --   opts = {
  --     defaults = {
  --       layout_strategy = "horizontal",
  --       layout_config = { prompt_position = "top" },
  --       sorting_strategy = "ascending",
  --       winblend = 0,
  --     },
  --   },
  -- },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },

  -- since `vim.tbl_deep_extend`, can only merge tables and not lists, the code above
  -- would overwrite `ensure_installed` with the new value.
  -- If you'd rather extend the default config, use the code below instead:
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- add tsx and treesitter
      vim.list_extend(opts.ensure_installed, {
        "tsx",
        "typescript",
      })
    end,
  },

  -- add any tools you want to have installed below
}
