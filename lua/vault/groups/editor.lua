local palette = require("vault.palette").colors
local config = require("vault.config")

---Get editor highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local transparent = config.transparent

  local bg = transparent and p.none or p.bg
  local bg_ui = transparent and p.none or p.ui_bg

  return {
    -- Window / Buffer
    Normal          = { fg = p.fg,      bg = bg },
    NormalNC        = { fg = p.fg,      bg = bg },
    NormalFloat     = { fg = p.fg,      bg = bg_ui },
    FloatBorder     = { fg = p.comment, bg = bg_ui },
    FloatTitle      = { fg = p.green,   bg = bg_ui, bold = true },

    -- Cursor and Line
    Cursor          = { fg = p.bg,      bg = p.fg },
    lCursor         = { fg = p.bg,      bg = p.fg },
    CursorIM        = { link = "Cursor" },
    TermCursor      = { link = "Cursor" },
    CursorColumn    = { bg = bg_ui },
    CursorLine      = { bg = bg_ui },
    CursorLineNr    = { fg = p.fg,      bold = true },
    CursorLineFold  = { link = "CursorLineNr" },
    CursorLineSign  = { link = "CursorLine" },

    -- Line Numbers and Signs
    LineNr          = { fg = p.comment },
    LineNrAbove     = { fg = p.comment },
    LineNrBelow     = { fg = p.comment },
    SignColumn      = { fg = p.comment, bg = bg },
    FoldColumn      = { fg = p.comment, bg = bg },

    -- Fold
    Folded          = { fg = p.comment, bg = bg_ui, italic = true },

    -- Status Line
    StatusLine       = { fg = p.fg,      bg = bg_ui },
    StatusLineNC     = { fg = p.comment, bg = bg_ui },
    StatusLineTerm   = { link = "StatusLine" },
    StatusLineTermNC = { link = "StatusLineNC" },

    -- Tab Line
    TabLine         = { fg = p.comment, bg = bg_ui },
    TabLineFill     = { bg = bg_ui },
    TabLineSel      = { fg = p.fg,      bg = bg,    bold = true },

    -- Win Bar
    WinBar          = { fg = p.fg,      bg = bg },
    WinBarNC        = { fg = p.comment, bg = bg },

    -- Search and Selection
    Search          = { fg = p.fg,      bg = p.search_bg, bold = true },
    IncSearch       = { fg = p.bg,      bg = p.green,     bold = true },
    CurSearch       = { link = "IncSearch" },
    Substitute      = { link = "IncSearch" },
    Visual          = { bg = p.selection },
    VisualNOS       = { link = "Visual" },
    MatchParen      = { fg = p.fg,      bold = true },

    -- Popup Menu (Completion)
    Pmenu           = { fg = p.fg,      bg = bg_ui },
    PmenuSel        = { fg = p.fg,      bg = p.selection, bold = true },
    PmenuSbar       = { bg = bg_ui },
    PmenuThumb      = { bg = p.comment },
    PmenuKind       = { fg = p.string,  bg = bg_ui },
    PmenuKindSel    = { fg = p.string,  bg = p.selection },
    PmenuExtra      = { fg = p.comment, bg = bg_ui },
    PmenuExtraSel   = { fg = p.comment, bg = p.selection },

    -- Window Separators
    WinSeparator    = { fg = p.comment },
    VertSplit       = { link = "WinSeparator" },

    -- Messages and Prompts
    ErrorMsg        = { fg = p.error,   bold = true },
    WarningMsg      = { fg = p.warning },
    ModeMsg         = { fg = p.fg,      bold = true },
    MoreMsg         = { fg = p.green },
    Question        = { fg = p.green },
    MsgArea         = { fg = p.fg },
    MsgSeparator    = { fg = p.comment },

    -- Diff
    DiffAdd         = { fg = p.green,   bg = p.selection },
    DiffChange      = { fg = p.warning, bg = bg_ui },
    DiffDelete      = { fg = p.error,   bg = bg_ui },
    DiffText        = { fg = p.fg,      bg = p.search_bg, bold = true },

    -- Spell
    SpellBad        = { undercurl = true, sp = p.error },
    SpellCap        = { undercurl = true, sp = p.warning },
    SpellLocal      = { undercurl = true, sp = p.info },
    SpellRare       = { undercurl = true, sp = p.hint },

    -- Miscellaneous UI
    NonText         = { fg = p.comment },
    EndOfBuffer     = { fg = bg_ui },
    Whitespace      = { fg = p.ui_bg },
    SpecialKey      = { fg = p.comment },
    Title           = { fg = p.green,   bold = true },
    Directory       = { fg = p.green },
    WildMenu        = { fg = p.fg,      bg = p.selection, bold = true },
    QuickFixLine    = { bg = bg_ui,     bold = true },
    Conceal         = { fg = p.comment },
    ColorColumn     = { bg = p.ui_bg },
  }
end

return { get = get }
