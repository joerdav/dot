---@type vim.lsp.Config
return {
	cmd = { 'templ', 'lsp' },
	filetypes = { 'templ', 'go' },
	root_markers = { 'go.work', 'go.mod' },
}
