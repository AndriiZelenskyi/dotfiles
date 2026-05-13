return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "f-person/auto-dark-mode.nvim",
        lazy = false,
        priority = 999,
        opts = {
            update_interval = 3000,
            set_dark_mode = function()
                vim.o.background = "dark"
                vim.cmd("colorscheme kanagawa-wave")
                vim.api.nvim_set_hl(0, "Cursor", { bg = "#dcd7ba", fg = "#1f1f28" })
                vim.api.nvim_set_hl(0, "lCursor", { link = "Cursor" })
            end,
            set_light_mode = function()
                vim.o.background = "light"
                vim.cmd("colorscheme kanagawa-lotus")
                vim.api.nvim_set_hl(0, "Cursor", { bg = "#43436c", fg = "#f2ecbc" })
                vim.api.nvim_set_hl(0, "lCursor", { link = "Cursor" })
            end,
            fallback = "dark",
        },
    },
}
