return {
    {
        "neovim/nvim-lspconfig",
        version = "*",
        config = function()
            require("lspconfig").lua_ls.setup({
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { "vim" },
                        },
                    },
                },
            })
        end,
    },
}
