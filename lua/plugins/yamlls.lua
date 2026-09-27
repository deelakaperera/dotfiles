-- One schema per Kubernetes kind: yamlls's built-in `kubernetes` schema covers every
-- kind at once and takes ~30s to load, so completion looks dead after opening a file.
local k8s = "https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.34.1-standalone-strict/"

return {
    {
	"neovim/nvim-lspconfig",
	ft = "yaml",
	config = function()
	    vim.lsp.config("yamlls", {
		settings = {
		    yaml = {
			schemas = {
			    [k8s .. "deployment-apps-v1.json"] = "*deployment*.yaml",
			    [k8s .. "service-v1.json"] = "*service*.yaml",
			    [k8s .. "configmap-v1.json"] = "*configmap*.yaml",
			    [k8s .. "secret-v1.json"] = "*secret*.yaml",
			    [k8s .. "ingress-networking-v1.json"] = "*ingress*.yaml",
			},
			schemaStore = { enable = true }, -- keeps docker-compose, GitHub Actions, etc. working
		    },
		},
	    })
	    vim.lsp.enable("yamlls")
	end,
    }
}
