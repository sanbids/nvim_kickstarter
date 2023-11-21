local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local utils = require("sanbid.core.utils")

autocmd("FileType", {
	pattern = { "lua", "javascriptreact", "typescriptreact", "javascript", "typescript" },
	callback = function()
		vim.lsp.inlay_hint.enable(0,true)
	end,
})

autocmd("BufReadPre", {
	desc = "Disable certain functionality on very large files",
	callback = function(args)
		local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(args.buf))
		local convertMb = function()
			local mb = stats.size / (1024 * 1024)
			return mb
		end
		-- even files is more then 1.5MB then disable nvim-cmp treesitter and lsp
		if ok and stats and convertMb() > 1 then
			utils.toggle_cmp()
			utils.treesitter_toggle(args.buf)
			utils.toggle_diagnostics(args.buf, true)
			print("Big files", convertMb())
		end
	end,
})

--make close any float buffer one
autocmd("BufWinEnter", {
	desc = "Make q close help, man, quickfix, dap floats",
	group = augroup("q_close_windows", { clear = true }),
	callback = function(args)
		local buftype = vim.api.nvim_get_option_value("buftype", { buf = args.buf })
		if vim.tbl_contains({ "help", "nofile", "quickfix" }, buftype) and vim.fn.maparg("q", "n") == "" then
			vim.keymap.set("n", "q", "<cmd>close<cr>", {
				desc = "Close window",
				buffer = args.buf,
				silent = true,
				nowait = true,
			})
		end
	end,
})

-- fast yank
autocmd("TextYankPost", {
	desc = "Highlight yanked text",
	group = augroup("highlightyank", { clear = true }),
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({
			timeout = 100,
		})
	end,
})

-- open files
autocmd("BufEnter", {
	desc = "Open Neo-Tree on startup with directory",
	group = augroup("neotree_start", { clear = true }),
	callback = function()
		if package.loaded["neo-tree"] then
			vim.api.nvim_del_augroup_by_name("neotree_start")
		else
			local stats = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(0)) -- TODO: REMOVE vim.loop WHEN DROPPING SUPPORT FOR Neovim v0.9
			if stats and stats.type == "directory" then
				vim.api.nvim_del_augroup_by_name("neotree_start")
				require("neo-tree")
			end
		end
	end,
})
autocmd("TermClose", {
	pattern = "*lazygit",
	desc = "Refresh Neo-Tree git when closing lazygit",
	group = augroup("neotree_git_refresh", { clear = true }),
	callback = function()
		if package.loaded["neo-tree.sources.git_status"] then
			require("neo-tree.sources.git_status").refresh()
		end
	end,
})
