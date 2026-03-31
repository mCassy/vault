-- vault highlight groups: traditional syntax (~40 groups)
-- Implemented in Phase 2, Plan 02.
-- c = palette.colors table (keys: bg, fg, green, comment, string, ui_bg,
--                            error, warning, info, hint, selection, search_bg)
local M = {}

function M.get(c)
  return {
    Comment         = { fg = c.comment, italic = true },         -- SYN-02: dim amber + italic

    -- Constants and values
    Constant        = { fg = c.string },
    String          = { fg = c.string },
    Character       = { link = "String" },
    Number          = { link = "Constant" },
    Boolean         = { link = "Constant" },
    Float           = { link = "Constant" },

    -- Identifiers
    Identifier      = { fg = c.fg },
    Function        = { fg = c.fg,      bold = true },

    -- Statements and keywords (SYN-03)
    Statement       = { fg = c.green,   bold = true },
    Conditional     = { link = "Statement" },
    Repeat          = { link = "Statement" },
    Label           = { link = "Statement" },
    Operator        = { fg = c.fg },
    Keyword         = { fg = c.green,   bold = true },            -- SYN-03: Matrix green + bold
    Exception       = { link = "Keyword" },

    -- Preprocessor
    PreProc         = { fg = c.fg },
    Include         = { link = "PreProc" },
    Define          = { link = "PreProc" },
    Macro           = { link = "PreProc" },
    PreCondit       = { link = "PreProc" },

    -- Types
    Type            = { fg = c.fg },
    StorageClass    = { link = "Type" },
    Structure       = { link = "Type" },
    Typedef         = { link = "Type" },

    -- Specials
    Special         = { fg = c.string },
    SpecialChar     = { link = "Special" },
    Tag             = { fg = c.green },
    Delimiter       = { fg = c.fg },
    SpecialComment  = { fg = c.comment, italic = true },
    Debug           = { fg = c.warning },

    -- Misc
    Underlined      = { underline = true },
    Ignore          = { fg = c.comment },
    Error           = { fg = c.error,   bold = true },
    Todo            = { fg = c.green,   bold = true },
  }
end

return M
