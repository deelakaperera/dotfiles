return {
  "zbirenbaum/copilot-cmp",
  config = function ()
    require("copilot_cmp").setup({
	sources = {
	    -- Copilot Source
	    { name = "copilot", group_index = 2 },
	    -- Other Sources
	    { name = "nvim_lsp", group_index = 2 },
	    { name = "path", group_index = 2 },
	    { name = "luasnip", group_index = 2 },
	},
	formatting = {
	    format = lspkind.cmp_format({
	    mode = "symbol",
	    max_width = 50,
	    symbol_map = { Copilot = "" }
	    )}
	},
	sorting = {
	    priority_weight = 2,
	    comparators = {
		require("copilot_cmp.comparators").prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
	    cmp.config.compare.offset,
	     -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
	    cmp.config.compare.exact,
	    cmp.config.compare.score,
	    cmp.config.compare.recently_used,
	    cmp.config.compare.locality,
	    cmp.config.compare.kind,
	    cmp.config.compare.sort_text,
	    cmp.config.compare.length,
	    cmp.config.compare.order,
	    },
	},
	

	})
  end
}

