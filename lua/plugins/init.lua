return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "lua-language-server",
        "stylua",
        "prettier",
        "pyright",
        "prettier",
        "mypy",
        "ruff",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "python",
        "json",
      },
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function()
      return require "configs.null-ls"
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    config = function(_, opts)
      opts.actions = { open_file = { resize_window = false } }
      require("nvim-tree").setup(opts)
    end,
  },
}
