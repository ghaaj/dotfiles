return {
    {
        "goolord/alpha-nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local theme = require("alpha.themes.dashboard")
            require("alpha").setup(theme.config)
        end,
    },
}
