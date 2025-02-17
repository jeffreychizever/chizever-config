return {
  "LintaoAmons/bookmarks.nvim",
  dependencies = {
    {"kkharji/sqlite.lua"},
    {"nvim-telescope/telescope.nvim"},
    -- {"stevearc/dressing.nvim"} -- optional: better UI
  },
  config = function()
    local opts = {}
    require("bookmarks").setup(opts)
    vim.keymap.set("n", "<leader>bb", "<cmd>BookmarksMark<CR><CR>", { desc = "Place bookmark" })
    vim.keymap.set("n", "<leader>bt", "<cmd>BookmarksTree<CR><CR>", { desc = "View bookmarks" })
    vim.keymap.set("n", "<leader>bi", "<cmd>BookmarksInfo<CR><CR>", { desc = "Bookmarks info (keymap)" })
  end
}

-- run :BookmarksInfo to see the running status of the plugin
