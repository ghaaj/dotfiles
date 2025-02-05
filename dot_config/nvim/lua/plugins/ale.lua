return {
    {
        "dense-analysis/ale",
        config = function()
            local g = vim.g
            g.ale_lint_on_text_changed = "always"
            g.ale_linters = {
                lua = { "lua_language_server" },
                python = { "flake8" },
                powershell = { "PSScriptAnalyzer" },
                javascript = { "eslint" },
                typescript = { "eslint" },
            }
        end,
    },
}
