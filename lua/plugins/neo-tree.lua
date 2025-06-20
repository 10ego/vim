-- return {
--   "nvim-neo-tree/neo-tree.nvim",
--   branch = "v3.x",
--   opts = {
--     window = {
--       mappings = {
--         -- Remove default split mappings if you want
--         ["s"] = "noop",
--         ["S"] = "noop",
--
--         -- Your custom mappings
--         ["<C-v>"] = "open_vsplit", -- Vertical split
--         ["<C-x>"] = "open_split", -- Horizontal split
--       },
--     },
--   },
-- }
--
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  opts = {
    -- This setting is crucial for your request.
    -- It ensures that "hidden" items (like .gitignored files) are still present in the tree buffer but visually dimmed.
    -- This makes them available for the "visible_items" filter to find.
    filesystem = {
      filtered_items = {
        visible = true, -- Show filtered items as dimmed
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    window = {
      mappings = {
        -- Your existing custom mappings
        ["<C-v>"] = "open_vsplit",
        ["<C-x>"] = "open_split",
        ["s"] = "noop",

        -- DEFAULT BEHAVIOR (for reference)
        -- The default "/" runs "fuzzy_finder", which searches all files in the project.
        -- The default "f" runs "filter_on_submit", which requires you to press Enter.

        -- YOUR NEW BEHAVIOR
        -- This overrides "/" to use the built-in filter command.
        -- We pass a specific configuration to it.
        ["/"] = {
          "filter",
          config = {
            -- This is the key setting. It tells the filter to only consider nodes
            -- that are currently visible in the tree.
            search_spec = "visible",

            -- This makes the filtering happen live, as you type.
            match_algorithm = "fuzzy",
          },
        },

        -- It's good practice to have an easy way to clear the filter.
        ["<esc>"] = "clear_filter",
        ["<C-c>"] = "clear_filter", -- Alternative mapping
      },
    },
  },
}
