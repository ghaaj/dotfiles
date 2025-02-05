require("config.lazy")
vim.env.LANG = "en_US.UTF-8"
if vim.fn.has("win32") == 1 or vim.fn.has("win64") == 1 then
    vim.opt.shell = "pwsh.exe"
    vim.opt.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command"
else
    vim.opt.shell = "zsh"
end
vim.opt.fileencodings = "ucs-bom,utf-8,sjis,latin1"
vim.opt.showcmd = true
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.virtualedit = "onemore"
vim.opt.smartindent = true
vim.opt.visualbell = true
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.wildmode = "list:longest"
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.wrapscan = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.list = true
vim.opt.listchars = "tab:»-,extends:»,precedes:«,nbsp:%,space:･"
vim.opt.autoread = true
vim.api.nvim_set_keymap("n", "<Esc><Esc>", "<Cmd>nohlsearch<CR>", { noremap = true })
vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "U", "<C-r>", { noremap = true })
vim.api.nvim_set_keymap("n", "p", "]p`]", { noremap = true })
vim.api.nvim_set_keymap("n", "P", "]P`]", { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Up>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Down>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Left>", "<Nop>", { noremap = true })
vim.api.nvim_set_keymap("i", "<Right>", "<Nop>", { noremap = true })
vim.opt.termguicolors = true
vim.opt.guifont = "UbuntuMono Nerd Font:h15"
vim.opt.guifontwide = "M PLUS 1 Code:h15"
vim.cmd([[syntax enable]])
vim.cmd([[colorscheme nightfox]])
vim.api.nvim_set_keymap("n", "<C-n>", "<Cmd>Neotree toggle<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<Cmd>Lazy<CR>", { noremap = true })
