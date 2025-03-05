return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = function()
            require("nvim-treesitter.install").update({ with_sync = false })()
        end,
        run = ":TSUpdate",
        lazy = false,
        config = function()
            require("nvim-treesitter.install").compilers = { "clang" }
            require("nvim-treesitter.configs").setup({
                ensure_installed = {},
                sync_install = true,
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
