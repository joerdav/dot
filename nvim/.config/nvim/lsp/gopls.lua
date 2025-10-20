---@type vim.lsp.Config
return {
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	root_markers = { 'go.work', 'go.mod' },
	settings = {
        gopls = {
          codelenses = {
            generate = true,
            gc_details = true,
            test = true,
            upgrade_dependency = true,
            tidy = true,
          },
      },
	}
}
