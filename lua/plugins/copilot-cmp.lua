return {
    {
	"zbirenbaum/copilot-cmp",
	dependencies = { "hrsh7th/nvim-cmp", "hrsh7th/cmp-nvim-lsp", "onsails/lspkind.nvim", "zbirenbaum/copilot.lua" },
	config = function ()
	    require("copilot_cmp").setup()
	    -- tell every LSP server (e.g. yamlls) that nvim-cmp can take its completions
	    vim.lsp.config("*", { capabilities = require("cmp_nvim_lsp").default_capabilities() })
	    local cmp = require("cmp")
            local lspkind = require("lspkind")
	    local has_words_before = function()
		if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
		local line, col = unpack(vim.api.nvim_win_get_cursor(0))
		return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
	    end
            cmp.setup({
		mapping = cmp.mapping.preset.insert({
		    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			elseif has_words_before() then
			    cmp.complete()
			else
			    fallback()
			end
		    end, { "i", "s" }),
		    ["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
			    cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
			else
			    fallback()
			end
		    end, { "i", "s" }),
		    -- accept the highlighted item; plain Enter inserts a newline when nothing is selected
		    ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
		    ["<C-Space>"] = cmp.mapping.complete(),
		    ["<C-e>"] = cmp.mapping.abort(),
		}),
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
		    }),
		},
		sorting = {
		    priority_weight = 2,
		    comparators = {
			require("copilot_cmp.comparators").prioritize,
	
		        cmp.config.compare.offset,
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
}

