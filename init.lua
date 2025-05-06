-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- [[ Configure Catppuccin ]])
require("catppuccin").setup({
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    treesitter = true,
    notify = true,
    mini = {
      enabled = true,
      indentscope_color = "",
    },
    mason = true,
    telescope = {
      enabled = true,
      -- style = "nvchad"
    },
  },
})

vim.cmd.colorscheme("catppuccin")
