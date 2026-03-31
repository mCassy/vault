-- vault highlight groups: bufferline.nvim integration (~40 groups)
-- Covers all BufferLine* groups used by akinsho/bufferline.nvim v4+.
--
-- Three-state model per bufferline's design:
--   Selected  — the active (focused) buffer
--   Visible   — visible in a split but not focused
--   (default) — inactive buffer in background
--
-- Design intent (palette discipline):
--   Fill / tabline chrome  → bg (#0a0a00) — recedes completely
--   Inactive buffers       → comment (#5a5200) fg, ui_bg (#2a2800) bg — dim, in-palette
--   Visible (non-focused)  → fg (#c8b400) fg, ui_bg bg — readable but not dominant
--   Selected buffer        → fg (#c8b400) fg, bg (#0a0a00) bg, bold — pops off chrome
--   Modified indicator     → green (#00ff41) — only sanctioned green accent here
--   Diagnostics            → map to existing semantic colors (error, warning, info, hint)
--   Pick letter            → green bold — high-signal, brief
--   No teal/cyan anywhere  — those are bufferline's built-in defaults bleeding through

local M = {}

function M.get(c)
  return {
    -- Tabline fill — the background strip behind all tabs (BL-01)
    BufferLineFill                = { bg = c.bg },

    -- Tab UI (non-buffer tab list entries) (BL-02)
    BufferLineTab                 = { fg = c.comment, bg = c.ui_bg },
    BufferLineTabSelected         = { fg = c.fg,      bg = c.bg,    bold = true },
    BufferLineTabClose            = { fg = c.comment, bg = c.ui_bg },
    BufferLineTabSeparator        = { fg = c.bg,      bg = c.ui_bg },
    BufferLineTabSeparatorSelected = { fg = c.bg,     bg = c.bg },

    -- Inactive buffers (BL-03)
    BufferLineBackground          = { fg = c.comment, bg = c.ui_bg },
    BufferLineBuffer              = { fg = c.comment, bg = c.ui_bg },
    BufferLineNumbers             = { fg = c.comment, bg = c.ui_bg },
    BufferLineCloseButton         = { fg = c.comment, bg = c.ui_bg },
    BufferLineModified            = { fg = c.green,   bg = c.ui_bg },
    BufferLineDuplicate           = { fg = c.comment, bg = c.ui_bg, italic = true },
    BufferLineSeparator           = { fg = c.bg,      bg = c.ui_bg },
    BufferLineIndicatorVisible    = { fg = c.ui_bg,   bg = c.ui_bg },

    -- Visible (split-visible, not focused) buffers (BL-04)
    BufferLineBufferVisible       = { fg = c.fg,      bg = c.ui_bg },
    BufferLineNumbersVisible      = { fg = c.comment, bg = c.ui_bg },
    BufferLineCloseButtonVisible  = { fg = c.comment, bg = c.ui_bg },
    BufferLineModifiedVisible     = { fg = c.green,   bg = c.ui_bg },
    BufferLineDuplicateVisible    = { fg = c.comment, bg = c.ui_bg, italic = true },
    BufferLineSeparatorVisible    = { fg = c.bg,      bg = c.ui_bg },

    -- Selected (active, focused) buffer (BL-05)
    -- Bold fg on bg creates clear visual separation from inactive tabs
    BufferLineBufferSelected      = { fg = c.fg,      bg = c.bg,    bold = true },
    BufferLineNumbersSelected     = { fg = c.fg,      bg = c.bg,    bold = true },
    BufferLineCloseButtonSelected = { fg = c.comment, bg = c.bg },
    BufferLineModifiedSelected    = { fg = c.green,   bg = c.bg },
    BufferLineDuplicateSelected   = { fg = c.comment, bg = c.bg,    italic = true },
    BufferLineSeparatorSelected   = { fg = c.bg,      bg = c.bg },
    BufferLineIndicatorSelected   = { fg = c.fg,      bg = c.bg },

    -- Pick (buffer jump shortcut) letters (BL-06)
    -- Bright green for high-signal brief interaction; all three states need coverage
    BufferLinePick               = { fg = c.green,   bg = c.ui_bg, bold = true },
    BufferLinePickVisible        = { fg = c.green,   bg = c.ui_bg, bold = true },
    BufferLinePickSelected       = { fg = c.green,   bg = c.bg,    bold = true },

    -- Diagnostic indicators — inactive (BL-07)
    BufferLineError              = { fg = c.error,   bg = c.ui_bg },
    BufferLineErrorDiagnostic    = { fg = c.error,   bg = c.ui_bg },
    BufferLineWarning            = { fg = c.warning, bg = c.ui_bg },
    BufferLineWarningDiagnostic  = { fg = c.warning, bg = c.ui_bg },
    BufferLineInfo               = { fg = c.info,    bg = c.ui_bg },
    BufferLineInfoDiagnostic     = { fg = c.info,    bg = c.ui_bg },
    BufferLineHint               = { fg = c.hint,    bg = c.ui_bg },
    BufferLineHintDiagnostic     = { fg = c.hint,    bg = c.ui_bg },

    -- Diagnostic indicators — visible (BL-07)
    BufferLineErrorVisible             = { fg = c.error,   bg = c.ui_bg },
    BufferLineErrorDiagnosticVisible   = { fg = c.error,   bg = c.ui_bg },
    BufferLineWarningVisible           = { fg = c.warning, bg = c.ui_bg },
    BufferLineWarningDiagnosticVisible = { fg = c.warning, bg = c.ui_bg },
    BufferLineInfoVisible              = { fg = c.info,    bg = c.ui_bg },
    BufferLineInfoDiagnosticVisible    = { fg = c.info,    bg = c.ui_bg },
    BufferLineHintVisible              = { fg = c.hint,    bg = c.ui_bg },
    BufferLineHintDiagnosticVisible    = { fg = c.hint,    bg = c.ui_bg },

    -- Diagnostic indicators — selected (BL-07)
    BufferLineErrorSelected             = { fg = c.error,   bg = c.bg },
    BufferLineErrorDiagnosticSelected   = { fg = c.error,   bg = c.bg },
    BufferLineWarningSelected           = { fg = c.warning, bg = c.bg },
    BufferLineWarningDiagnosticSelected = { fg = c.warning, bg = c.bg },
    BufferLineInfoSelected              = { fg = c.info,    bg = c.bg },
    BufferLineInfoDiagnosticSelected    = { fg = c.info,    bg = c.bg },
    BufferLineHintSelected              = { fg = c.hint,    bg = c.bg },
    BufferLineHintDiagnosticSelected    = { fg = c.hint,    bg = c.bg },

    -- Offset separator (for file-tree panels like nvim-tree) (BL-08)
    BufferLineOffsetSeparator     = { fg = c.comment, bg = c.ui_bg },

    -- Trunc marker (shown when tabs overflow the width) (BL-09)
    BufferLineTruncMarker         = { fg = c.comment, bg = c.ui_bg },
  }
end

return M
