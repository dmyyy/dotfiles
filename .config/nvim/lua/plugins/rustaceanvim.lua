return {
  "mrcjkb/rustaceanvim",
  version = "^5", -- Recommended
  lazy = false, -- This plugin is already lazy
  ft = { "rust" },
  opts = {
    server = {
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>dr", function()
          vim.cmd.RustLsp("debuggables")
        end, { desc = "Rust Debuggables", buffer = bufnr })
      end,
      default_settings = {
        -- rust-analyzer language server configuration
        ["rust-analyzer"] = {
          cargo = {
            -- features = {
            --   -- NOTE: ***** CARGO FEATURES HERE *****
            --   "all",
            -- },
            -- disable all features unless working on tests
            -- allFeatures = true,
            loadOutDirsFromCheck = true,
            buildScripts = {
              -- enable = true,
              enable = false,
            },
            extraEnv = {
              ["RUSTFLAGS"] = "-Clink-arg=-fuse-ld=/usr/bin/mold",
            },
          },
          -- Add clippy lints for Rust.
          checkOnSave = true,
          check = {
            workspace = false,
            extraArgs = {
              "--target-dir=target/analyzer",
            },
          },
          -- https://github.com/rust-lang/rust-analyzer/issues/6007
          server = {
            extraEnv = {
              ["CARGO_TARGET_DIR"] = "target/analyzer",
              ["RUSTUP_TOOLCHAIN"] = "stable",
            },
          },
          diagnostics = {
            disabled = {
              "unlinked-file",
            },
          },
          -- 12/29/2024 - neovim doesn't handle server cancelled requests well resulting in noice error message spam
          -- https://old.reddit.com/r/rust/comments/1geyfld/rustanalyzer_server_cancelled_the_request_in/
          -- FIXME: don't need this anymore i think?
          -- diagnostic = {
          --   refreshSupport = false,
          -- },
          procMacro = {
            enable = true,
            ignored = {
              ["async-trait"] = { "async_trait" },
              ["napi-derive"] = { "napi" },
              ["async-recursion"] = { "async_recursion" },
            },
          },
        },
      },
    },
  },
  config = function(_, opts)
    vim.g.rustaceanvim = vim.tbl_deep_extend("keep", vim.g.rustaceanvim or {}, opts or {})
    if vim.fn.executable("rust-analyzer") == 0 then
      LazyVim.error(
        "**rust-analyzer** not found in PATH, please install it.\nhttps://rust-analyzer.github.io/",
        { title = "rustaceanvim" }
      )
    end
  end,
}
