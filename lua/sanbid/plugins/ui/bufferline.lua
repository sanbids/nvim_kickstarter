return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      separator_style = "slope",
      numbers = "none", -- "ordinal","buffer_id"
      diagnostics = "nvim_lsp"
      --  separator_style = "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
    },
  },
}
