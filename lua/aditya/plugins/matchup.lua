
return {
    "andymass/vim-matchup",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
        vim.g.matchup_matchparen_enabled = 1
    end,
}

