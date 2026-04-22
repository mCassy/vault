local palette = require("vault.palette").colors
local config = require("vault.config")

---Get tree-sitter @capture highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette

  return {
    -- Variables
    ["@variable"]                    = { fg = p.fg, italic = config.is_italic("variables") },
    ["@variable.builtin"]            = { fg = p.green },
    ["@variable.parameter"]          = { fg = p.fg, italic = config.is_italic("parameters") },
    ["@variable.parameter.builtin"]  = { link = "@variable.builtin" },
    ["@variable.member"]             = { fg = p.fg },

    -- Constants
    ["@constant"]                    = { fg = p.string },
    ["@constant.builtin"]            = { link = "@constant" },
    ["@constant.macro"]              = { link = "@constant" },

    -- Modules and Labels
    ["@module"]                      = { fg = p.fg },
    ["@module.builtin"]              = { fg = p.green },
    ["@label"]                       = { fg = p.fg },

    -- Strings
    ["@string"]                      = { fg = p.string, italic = config.is_italic("strings") },
    ["@string.documentation"]        = { fg = p.comment, italic = true },
    ["@string.regexp"]               = { fg = p.string },
    ["@string.escape"]               = { fg = p.green },
    ["@string.special"]              = { link = "@string" },
    ["@string.special.symbol"]       = { link = "@string" },
    ["@string.special.path"]         = { link = "@string" },
    ["@string.special.url"]          = { fg = p.string, underline = true },

    -- Characters and Booleans
    ["@character"]                   = { link = "@string" },
    ["@character.special"]           = { link = "@string" },
    ["@boolean"]                     = { link = "@constant" },

    -- Numbers
    ["@number"]                      = { link = "@constant" },
    ["@number.float"]                = { link = "@constant" },

    -- Types
    ["@type"]                        = { fg = p.fg },
    ["@type.builtin"]                = { fg = p.fg, italic = true },
    ["@type.definition"]             = { link = "@type" },

    -- Attributes
    ["@attribute"]                   = { fg = p.comment },
    ["@attribute.builtin"]           = { link = "@attribute" },
    ["@property"]                    = { fg = p.fg },

    -- Functions
    ["@function"]                    = { fg = p.fg, bold = true, italic = config.is_italic("functions") },
    ["@function.builtin"]            = { fg = p.green },
    ["@function.call"]               = { link = "@function" },
    ["@function.macro"]              = { link = "@function" },
    ["@function.method"]             = { link = "@function" },
    ["@function.method.call"]        = { link = "@function" },
    ["@constructor"]                 = { link = "@function" },

    -- Operators and Keywords
    ["@operator"]                    = { fg = p.fg },
    ["@keyword"]                     = { fg = p.green, bold = true, italic = config.is_italic("keywords") },
    ["@keyword.coroutine"]           = { link = "@keyword" },
    ["@keyword.function"]            = { link = "@keyword" },
    ["@keyword.operator"]            = { link = "@keyword" },
    ["@keyword.import"]              = { link = "@keyword" },
    ["@keyword.type"]                = { link = "@keyword" },
    ["@keyword.modifier"]            = { link = "@keyword" },
    ["@keyword.repeat"]              = { link = "@keyword" },
    ["@keyword.return"]              = { link = "@keyword" },
    ["@keyword.debug"]               = { link = "@keyword" },
    ["@keyword.exception"]           = { link = "@keyword" },
    ["@keyword.conditional"]         = { link = "@keyword" },
    ["@keyword.conditional.ternary"] = { link = "@operator" },
    ["@keyword.directive"]           = { link = "@keyword" },
    ["@keyword.directive.define"]    = { link = "@keyword" },

    -- Punctuation
    ["@punctuation.delimiter"]       = { fg = p.fg },
    ["@punctuation.bracket"]         = { fg = p.fg },
    ["@punctuation.special"]         = { fg = p.green },

    -- Comments
    ["@comment"]                     = { fg = p.comment, italic = config.is_italic("comments") },
    ["@comment.documentation"]       = { fg = p.comment, italic = true },
    ["@comment.error"]               = { fg = p.error },
    ["@comment.warning"]             = { fg = p.warning },
    ["@comment.todo"]                = { fg = p.green, bold = true },
    ["@comment.note"]                = { fg = p.fg, bold = true },

    -- Markup
    ["@markup.strong"]               = { bold = true },
    ["@markup.italic"]               = { italic = true },
    ["@markup.strikethrough"]        = { strikethrough = true },
    ["@markup.underline"]            = { underline = true },
    ["@markup.heading"]              = { fg = p.green, bold = true },
    ["@markup.heading.1"]            = { link = "@markup.heading" },
    ["@markup.heading.2"]            = { link = "@markup.heading" },
    ["@markup.heading.3"]            = { link = "@markup.heading" },
    ["@markup.heading.4"]            = { link = "@markup.heading" },
    ["@markup.heading.5"]            = { link = "@markup.heading" },
    ["@markup.heading.6"]            = { link = "@markup.heading" },
    ["@markup.quote"]                = { fg = p.comment, italic = true },
    ["@markup.math"]                 = { fg = p.string },
    ["@markup.link"]                 = { fg = p.fg, underline = true },
    ["@markup.link.label"]           = { link = "@markup.link" },
    ["@markup.link.url"]             = { fg = p.string, underline = true },
    ["@markup.raw"]                  = { fg = p.comment },
    ["@markup.raw.block"]            = { link = "@markup.raw" },
    ["@markup.list"]                 = { fg = p.fg },
    ["@markup.list.checked"]         = { fg = p.green },
    ["@markup.list.unchecked"]       = { fg = p.comment },

    -- Diff
    ["@diff.plus"]                   = { fg = p.green },
    ["@diff.minus"]                  = { fg = p.error },
    ["@diff.delta"]                  = { fg = p.warning },

    -- Tags (HTML/XML/JSX)
    ["@tag"]                         = { fg = p.green },
    ["@tag.builtin"]                 = { link = "@tag" },
    ["@tag.attribute"]               = { fg = p.fg },
    ["@tag.delimiter"]               = { fg = p.fg },

    -- Spell and Conceal
    ["@spell"]                       = {},
    ["@nospell"]                     = { link = "@spell" },
    ["@conceal"]                     = { fg = p.comment },
  }
end

return { get = get }
