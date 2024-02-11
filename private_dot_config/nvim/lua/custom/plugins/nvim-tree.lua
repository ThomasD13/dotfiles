return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      filters = {
        dotfiles = true,
      },
    }
    -- Helper function to setup a custom keybindings when nvim-tree buffer is active
    local function my_on_attach(bufnr)
      local api = require "nvim-tree.api"

      local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- add/overwrite custom mappings
      vim.keymap.set('n', '?',     api.tree.toggle_help, opts('Help'))
    end

    -- pass to setup along with your other options
    require("nvim-tree").setup {
      ---
      on_attach = my_on_attach,
      ---
    }
    -- Keybinding in "normal" vi mode
    local anotherApi = require "nvim-tree.api"
    vim.keymap.set('n', '<leader>t', anotherApi.tree.toggle, { desc = "Toogle nvim-tree" })
  end,
}
