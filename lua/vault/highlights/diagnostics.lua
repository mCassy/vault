-- vault highlight groups: LSP diagnostics (~33 groups)
-- Covers: DIAG-01 (base), DIAG-02 (virtual text), DIAG-03 (underline),
--         DIAG-04 (sign column), DIAG-05 (deprecated/unnecessary), DIAG-06 (colors)
local M = {}

function M.get(c)
  return {
    -- Base diagnostic groups (DIAG-01)
    -- DIAG-06: error = warm rust-red (#cc4400), warn = amber-orange (#c87000)
    DiagnosticError   = { fg = c.error },
    DiagnosticWarn    = { fg = c.warning },
    DiagnosticInfo    = { fg = c.info },
    DiagnosticHint    = { fg = c.hint },
    DiagnosticOk      = { fg = c.green },

    -- Virtual text groups (DIAG-02) — italic for visual de-emphasis
    DiagnosticVirtualTextError = { fg = c.error,   bg = c.bg, italic = true },
    DiagnosticVirtualTextWarn  = { fg = c.warning, bg = c.bg, italic = true },
    DiagnosticVirtualTextInfo  = { fg = c.info,    bg = c.bg, italic = true },
    DiagnosticVirtualTextHint  = { fg = c.hint,    bg = c.bg, italic = true },
    DiagnosticVirtualTextOk    = { fg = c.green,   bg = c.bg, italic = true },

    -- Underline groups (DIAG-03)
    -- CRITICAL: undercurl color is sp =, NOT fg =
    DiagnosticUnderlineError = { undercurl = true, sp = c.error },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = c.warning },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = c.info },
    DiagnosticUnderlineHint  = { undercurl = true, sp = c.hint },
    DiagnosticUnderlineOk    = { undercurl = true, sp = c.green },

    -- Floating window groups (link to base — same color, different context)
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingWarn  = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo  = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint  = { link = "DiagnosticHint" },
    DiagnosticFloatingOk    = { link = "DiagnosticOk" },

    -- Sign column groups (DIAG-04) — link to base
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn  = { link = "DiagnosticWarn" },
    DiagnosticSignInfo  = { link = "DiagnosticInfo" },
    DiagnosticSignHint  = { link = "DiagnosticHint" },
    DiagnosticSignOk    = { link = "DiagnosticOk" },

    -- Special cases (DIAG-05)
    DiagnosticDeprecated  = { strikethrough = true, fg = c.comment },
    DiagnosticUnnecessary = { fg = c.comment },

    -- Virtual lines (Neovim 0.10+) — link to virtual text groups
    DiagnosticVirtualLinesError = { link = "DiagnosticVirtualTextError" },
    DiagnosticVirtualLinesWarn  = { link = "DiagnosticVirtualTextWarn" },
    DiagnosticVirtualLinesInfo  = { link = "DiagnosticVirtualTextInfo" },
    DiagnosticVirtualLinesHint  = { link = "DiagnosticVirtualTextHint" },
    DiagnosticVirtualLinesOk    = { link = "DiagnosticVirtualTextOk" },
  }
end

return M
