use {
  'anasinnyk/nvim-k8s-crd',
  event = { "BufReadPre", "BufNewFile" }, -- or { 'BufEnter *.yaml' },
  dependencies = { 'neovim/nvim-lspconfig' },
  opts = {
    cache_dir = "~/.cache/k8s-schemas/",
    k8s = {
      file_mask = "*.yaml",
    }
  },
}

require('nvim-k8s-crd').setup({
  cache_dir = "./.k8s-schemas/",  -- Local directory relative to the current working directory
  k8s = {
    file_mask = "*.yaml",  -- File mask to match Kubernetes manifests
  },
})
