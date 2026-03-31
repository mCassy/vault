-- vault highlight groups: core editor UI (~70 groups)
-- Implemented in Phase 2, Plan 02.
-- c = palette.colors table (keys: bg, fg, green, comment, string, ui_bg,
--                            error, warning, info, hint, selection, search_bg)
local M = {}

function M.get(c)
  return {
    -- Window / Buffer
    Normal          = { fg = c.fg,      bg = c.bg },
    NormalNC        = { fg = c.fg,      bg = c.bg },
    NormalFloat     = { fg = c.fg,      bg = c.ui_bg },
    FloatBorder     = { fg = c.comment, bg = c.ui_bg },
    FloatTitle      = { fg = c.green,   bg = c.ui_bg, bold = true },

    -- Cursor and Line
    Cursor          = { fg = c.bg,      bg = c.fg },
    CursorIM        = { link = "Cursor" },
    CursorColumn    = { bg = c.ui_bg },
    CursorLine      = { bg = c.ui_bg },
    CursorLineNr    = { fg = c.fg,      bold = true },
    CursorLineFold  = { link = "CursorLineNr" },
    CursorLineSign  = { link = "CursorLine" },

    -- Line Numbers and Signs
    LineNr          = { fg = c.comment },
    LineNrAbove     = { fg = c.comment },
    LineNrBelow     = { fg = c.comment },
    SignColumn      = { fg = c.comment, bg = c.bg },
    FoldColumn      = { fg = c.comment, bg = c.bg },

    -- Fold
    Folded          = { fg = c.comment, bg = c.ui_bg, italic = true },

    -- Status Line
    StatusLine      = { fg = c.fg,      bg = c.ui_bg },
    StatusLineNC    = { fg = c.comment, bg = c.ui_bg },
    StatusLineTerm  = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },

    -- Tab Line
    TabLine         = { fg = c.comment, bg = c.ui_bg },
    TabLineFill     = { bg = c.ui_bg },
    TabLineSel      = { fg = c.fg,      bg = c.bg,    bold = true },

    -- Win Bar
    WinBar          = { fg = c.fg,      bg = c.bg },
    WinBarNC        = { fg = c.comment, bg = c.bg },

    -- Search and Selection
    Search          = { fg = c.fg,      bg = c.search_bg, bold = true },
    IncSearch       = { fg = c.bg,      bg = c.green,     bold = true },
    CurSearch       = { link = "IncSearch" },
    Visual          = { bg = c.selection },
    VisualNOS       = { link = "Visual" },
    MatchParen      = { fg = c.fg,      bold = true },

    -- Popup Menu (Completion)
    Pmenu           = { fg = c.fg,      bg = c.ui_bg },
    PmenuSel        = { fg = c.fg,      bg = c.selection, bold = true },
    PmenuSbar       = { bg = c.ui_bg },
    PmenuThumb      = { bg = c.comment },
    PmenuKind       = { fg = c.string,  bg = c.ui_bg },
    PmenuKindSel    = { fg = c.string,  bg = c.selection },
    PmenuExtra      = { fg = c.comment, bg = c.ui_bg },
    PmenuExtraSel   = { fg = c.comment, bg = c.selection },

    -- Window Separators
    WinSeparator    = { fg = c.comment },
    VertSplit       = { link = "WinSeparator" },

    -- Messages and Prompts
    ErrorMsg        = { fg = c.error,   bold = true },
    WarningMsg      = { fg = c.warning },
    ModeMsg         = { fg = c.fg,      bold = true },
    MoreMsg         = { fg = c.green },
    Question        = { fg = c.green },
    MsgArea         = { fg = c.fg },
    MsgSeparator    = { fg = c.comment },

    -- Diff
    DiffAdd         = { fg = c.green,   bg = c.selection },
    DiffChange      = { fg = c.warning, bg = c.ui_bg },
    DiffDelete      = { fg = c.error,   bg = c.ui_bg },
    DiffText        = { fg = c.fg,      bg = c.search_bg, bold = true },

    -- Spell
    SpellBad        = { undercurl = true, sp = c.error },
    SpellCap        = { undercurl = true, sp = c.warning },
    SpellLocal      = { undercurl = true, sp = c.info },
    SpellRare       = { undercurl = true, sp = c.hint },

    -- Miscellaneous UI
    NonText         = { fg = c.comment },
    EndOfBuffer     = { fg = c.ui_bg },
    Whitespace      = { fg = c.ui_bg },
    SpecialKey      = { fg = c.comment },
    Title           = { fg = c.green,   bold = true },
    Directory       = { fg = c.green },
    WildMenu        = { fg = c.fg,      bg = c.selection, bold = true },
    QuickFixLine    = { bg = c.ui_bg,   bold = true },
    Conceal         = { fg = c.comment },
    ColorColumn     = { bg = c.ui_bg },
  }
end

return M
