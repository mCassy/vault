local palette = require("vault.palette").colors
local config = require("vault.config")

---Get traditional syntax highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette

  return {
    Comment         = { fg = p.comment, italic = config.is_italic("comments") },

    -- Constants and values
    Constant        = { fg = p.string,  italic = config.is_italic("strings") },
    String          = { fg = p.string,  italic = config.is_italic("strings") },
    Character       = { link = "String" },
    Number          = { link = "Constant" },
    Boolean         = { link = "Constant" },
    Float           = { link = "Constant" },

    -- Identifiers
    Identifier      = { fg = p.fg,      italic = config.is_italic("variables") },
    Function        = { fg = p.fg,      bold = true, italic = config.is_italic("functions") },

    -- Statements and keywords
    Statement       = { fg = p.green,   bold = true, italic = config.is_italic("keywords") },
    Conditional     = { link = "Statement" },
    Repeat          = { link = "Statement" },
    Label           = { link = "Statement" },
    Operator        = { fg = p.fg },
    Keyword         = { fg = p.green,   bold = true, italic = config.is_italic("keywords") },
    Exception       = { link = "Keyword" },

    -- Preprocessor
    PreProc         = { fg = p.fg },
    Include         = { link = "PreProc" },
    Define          = { link = "PreProc" },
    Macro           = { link = "PreProc" },
    PreCondit       = { link = "PreProc" },

    -- Types
    Type            = { fg = p.fg },
    StorageClass    = { link = "Type" },
    Structure       = { link = "Type" },
    Typedef         = { link = "Type" },

    -- Specials
    Special         = { fg = p.string },
    SpecialChar     = { link = "Special" },
    Tag             = { fg = p.green },
    Delimiter       = { fg = p.fg },
    SpecialComment  = { fg = p.comment, italic = true },
    Debug           = { fg = p.warning },

    -- Misc
    Underlined      = { underline = true },
    Ignore          = { fg = p.comment },
    Error           = { fg = p.error,   bold = true },
    Todo            = { fg = p.green,   bold = true },
  }
end

return { get = get }
