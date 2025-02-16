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
  end,
}

-- run :BookmarksInfo to see the running status of the plugin
