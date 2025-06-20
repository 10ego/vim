return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    -- This plugin is the magic behind the window picker
    "s1n7ax/nvim-window-picker",
  },
  opts = {
    -- This is a good practice to ensure the window picker is configured.
    -- LazyVim often handles this, but being explicit is safe.
    config = function()
      require("window-picker").setup({
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          -- Filter out neo-tree and other floating windows
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify", "TelescopePrompt" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
    -- Keeps hidden files available for our filter
    filesystem = {
      filtered_items = {
        visible = true, -- Show filtered items as dimmed
        hide_dotfiles = false,
        hide_gitignored = true,
      },
    },
    window = {
      mappings = {
        -- Previous filtering solution from last time
        ["/"] = {
          "filter",
          config = {
            search_spec = "visible",
            match_algorithm = "fuzzy",
          },
        },
        ["<esc>"] = "clear_filter",
        ["<C-c>"] = "clear_filter",

        -- New mappings for window picking splits
        ["<C-v>"] = "vsplit_with_window_picker",
        ["<C-x>"] = "split_with_window_picker",

        -- Optional: You can keep the old behavior on a different key
        -- ["s"] = "open_split",
        -- ["S"] = "open_vsplit",

        -- Ensuring default mappings don't conflict
        ["s"] = "noop",
        ["S"] = "noop",
      },
    },
  },
}
