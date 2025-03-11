return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        version = "*",
        cmd = { "Neotree" },
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
}
