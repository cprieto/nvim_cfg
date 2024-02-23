local opt = vim.o

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  { import = "plugins" },
  { import = "plugins.lsp" }
})

-- Gutter
opt.number = true
opt.numberwidth = 4
opt.signcolumn = "yes"

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true

-- Indent
opt.wrap = true
opt.breakindent = true
opt.smartindent = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2

-- Save files
opt.writebackup = false
opt.swapfile = false
opt.undofile = true

-- Useless warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0

-- Other settings
opt.termguicolors = true
opt.cursorline = true
opt.mouse = "a"
