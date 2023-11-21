local M = {}

-- toggle nvim-cmp
function M.toggle_cmp()
	local ok, _ = pcall(require, "cmp")
	if ok then
		vim.g.nvim_cmp_toggle = not vim.g.nvim_cmp_toggle
	end
end

--toggle diagnostics
---@param buffer? number the buffer to toggle diagnostics on
function M.toggle_diagnostics(buffer, bool)
	if bool then
		vim.diagnostic.disable(buffer)
	else
		vim.diagnostic.enable(buffer)
	end
end

--- Toggle buffer semantic token highlighting for all language servers that support it
---@param bufnr? number the buffer to toggle the clients on
function M.toggle_buffer_semantic_tokens(bufnr)
	bufnr = bufnr or 0
	vim.b[bufnr].semantic_tokens_enabled = not vim.b[bufnr].semantic_tokens_enabled
	local toggled = false
	for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
		if client.server_capabilities.semanticTokensProvider then
			vim.lsp.semantic_tokens[vim.b[bufnr].semantic_tokens_enabled and "start" or "stop"](bufnr, client.id)
			toggled = true
		end
	end
end

--- Toggle syntax highlighting and treesitter
---@param bufnr? number the buffer to toggle syntax on
function M.treesitter_toggle(bufnr)
	bufnr = (bufnr and bufnr ~= 0) and bufnr or vim.api.nvim_win_get_buf(0)
	local ts_avail, parsers = pcall(require, "nvim-treesitter.parsers")
	if vim.bo[bufnr].syntax == "off" then
		if ts_avail and parsers.has_parser() then
			vim.treesitter.start(bufnr)
		end
		vim.bo[bufnr].syntax = "on"
		if not vim.b[bufnr].semantic_tokens_enabled then
			M.toggle_buffer_semantic_tokens(bufnr)
		end
	else
		if ts_avail and parsers.has_parser() then
			vim.treesitter.stop(bufnr)
		end
		vim.bo[bufnr].syntax = "off"
		if vim.b[bufnr].semantic_tokens_enabled then
			M.toggle_buffer_semantic_tokens(bufnr)
		end
	end
end


--- Toggle wrap
function M.toggle_wrap()
  vim.wo.wrap = not vim.wo.wrap
end

return M
