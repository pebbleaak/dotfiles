return {
  -- lazy.nvim can manage itself (optional)
  { "folke/lazy.nvim", lazy = false, priority = 1000 },

  -- C/C++ autoformatter using clang-format
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" }, -- lazy-load
    opts = {
      formatters_by_ft = {
        c   = { "clang_format" },
        cpp = { "clang_format" },
        h =   { "clang_format" },
        hpp = { "clang_format" },
        python = { "black" },   
      },
       formatters = {
      black = {
        command = "black",
        args = { "--quiet", "-" }, -- read from stdin
        stdin = true,
      },
    },

      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
    },
    keys = {
      {
        "<leader>f",
        function() require("conform").format({ async = true }) end,
        desc = "Format buffer",
      },
    },
  },

  -- add more plugins below this line
  -- Auto closing Brackets

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },
}

