return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        opts = {
          -- TODO: should be handled by rustaceanvim - don't do this?
          setup = {
            rust_analyzer = function()
              return true
            end,
          },
        },
        taplo = {
          keys = {
            {
              "K",
              function()
                if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                  require("crates").show_popup()
                else
                  vim.lsp.buf.hover()
                end
              end,
              desc = "Show Crate Documentation",
            },
          },
        },
      },
    },
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },

  -- {
  --   "saecki/crates.nvim",
  --   ft = { "toml" },
  --   config = function()
  --     require("crates").setup({
  --       completion = {
  --         cmp = {
  --           enabled = true,
  --         },
  --       },
  --     })
  --     require("cmp").setup.buffer({
  --       sources = { { name = "crates" } },
  --     })
  --   end,
  -- },

  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("go").setup()
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
    build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
  },
}
