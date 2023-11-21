local highlight = vim.api.nvim_set_hl
local yellow = "#e3d18a"
local red = "#fc514e"
local dark_blue = "#011627"
local emerald = "#21c7a8"
local white = "#c3ccdc"
local malibu = "#87bcff"

highlight(0, "DiagnosticVirtualTextError", { bg = dark_blue, fg = red })
highlight(0, "DiagnosticVirtualTextWarn", { bg = dark_blue, fg = yellow })
highlight(0, "DiagnosticVirtualTextInfo", { bg = dark_blue, fg = malibu })
highlight(0, "DiagnosticVirtualTextHint", { bg = dark_blue, fg = white })
highlight(0, "DiagnosticVirtualTextOk", { bg = dark_blue, fg = emerald })
highlight(0, "LspInlayHint", { bg = dark_blue, fg = "#7D7E8C" })
