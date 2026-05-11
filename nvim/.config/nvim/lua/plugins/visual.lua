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
            end,
            set_light_mode = function()
                vim.o.background = "light"
                vim.cmd("colorscheme kanagawa-lotus")
            end,
            fallback = "dark",
        },
    },
}
