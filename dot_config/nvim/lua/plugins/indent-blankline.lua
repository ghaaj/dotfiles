return {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = function(_, opts)
            -- Other blankline configuration here
            return require("indent-rainbowline").make_opts(opts)
        end,
        lazy = false,
        dependencies = {
            "TheGLander/indent-rainbowline.nvim",
        },
    },
}
