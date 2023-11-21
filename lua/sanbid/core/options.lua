vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.skip_ts_context_commentstring_module = true

local opt = vim.opt

-- toggle own config

vim.g.nvim_cmp_toggle = true
vim.cmd("hi LspInlayHint guifg=#9ca1aa guibg=#011627")

-- vim.env.NEXTAUTH = "bsadskj343kjdas"
-- vim.g.nightflyTransparent = true

-- vim.g.nightflyUnderlineMatchParen = false
vim.g.nightflyUndercurls = true
vim.g.nightflyVirtualTextColor = false

opt.number = true
opt.guicursor = ""

-- completion height
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.clipboard = "unnamedplus"
opt.hlsearch = false
opt.incsearch = true
opt.conceallevel = 3

opt.confirm = true

-- line numbers
opt.relativenumber = false -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.undofile = true
opt.undolevels = 10000

-- cursor line
opt.cursorline = false -- highlight the current cursor line

-- remove sidebar symbol
opt.showmode = false


-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

-- turn off swapfile
opt.swapfile = false

opt.scrolloff = 8 -- scroll down and up after 8
opt.laststatus = 3

-- remove "~"
opt.fillchars = {
	eob = " ",
}
