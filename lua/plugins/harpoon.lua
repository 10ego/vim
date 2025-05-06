return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  -- opts = {
  --   menu = {
  --     width = vim.api.nvim_win_get_width(0) - 4,
  --   },
  --   settings = {
  --     save_on_toggle = true,
  --   },
  -- },
  --
  config = function()
    local harpoon = require("harpoon")
    harpoon:extend({
      UI_CREATE = function(cx)
        vim.keymap.set("n", "<C-v>", function()
          harpoon.ui:select_menu_item({ vsplit = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-x>", function()
          harpoon.ui:select_menu_item({ split = true })
        end, { buffer = cx.bufnr })

        vim.keymap.set("n", "<C-t>", function()
          harpoon.ui:select_menu_item({ tabedit = true })
        end, { buffer = cx.bufnr })
      end,
    })
  end,
  keys = function()
    local keys = {
      {
        "<leader>fa",
        function()
          require("harpoon"):list():add()
        end,
        desc = "Harpoon File",
      },
      {
        "<leader>fh",
        function()
          local harpoon = require("harpoon")
          harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "Harpoon Quick Menu",
      },
    }
    -- for i = 1, 5 do
    --   table.insert(keys, {
    --     "<leader>" .. i,
    --     function()
    --       require("harpoon"):list():select(i)
    --     end,
    --     desc = "Harpoon to File " .. i,
    --   })
    -- end
    return keys
  end,
}
