return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  opts = {
    window = {
      mappings = {
        -- Remove default split mappings if you want
        ["s"] = "noop",
        ["S"] = "noop",

        -- Your custom mappings
        ["<C-v>"] = "open_vsplit", -- Vertical split
        ["<C-x>"] = "open_split", -- Horizontal split
      },
    },
  },
}
