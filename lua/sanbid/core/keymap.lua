vim.g.mapleader = " "
vim.g.maplocalleader = " "
local keymap = vim.keymap.set
local opts = { silent = true, noremap = true }

keymap("n", "<leader>e", ":Neotree  reveal_force_cwd toggle<cr>", opts)
keymap("n", "<leader>w", ":w<cr>", opts)
keymap("n", "<leader>W", ":wa<cr>", opts)
keymap("n", "<leader>r", ":so % | echo 'reloaded'<cr>", opts)

-- quit somethings
keymap("n", "<leader>q", ":q<cr>", opts)

--buffer
keymap("n", "H", ":bprevious<cr>", opts)
keymap("n", "L", ":bnext<cr>", opts)
keymap("n", "<leader>c", ":bdelete <cr>", opts)

--lsp
keymap("n", "<leader>lm", ":Mason <cr>", opts)
keymap("n", "<leader>li", ":LspInfo <cr>", opts)

-- ui
keymap("n", "<leader>uh", function()
	if vim.lsp.inlay_hint.is_enabled(0) then
    vim.lsp.inlay_hint.enable(0,false)
  else
    vim.lsp.inlay_hint.enable(0,true)
  end
end, opts)
