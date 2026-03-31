-- vault highlight groups: Tree-sitter @ capture groups (~100)
-- Covers: TS-01 (@ capture groups), TS-02 (@lsp.type.*), TS-03 (@lsp.mod.*)
local M = {}

function M.get(c)
  return {
    -- Variables
    ["@variable"]                    = { fg = c.fg },
    ["@variable.builtin"]            = { fg = c.green },
    ["@variable.parameter"]          = { fg = c.fg },
    ["@variable.parameter.builtin"]  = { link = "@variable.builtin" },
    ["@variable.member"]             = { fg = c.fg },

    -- Constants
    ["@constant"]                    = { fg = c.string },
    ["@constant.builtin"]            = { link = "@constant" },
    ["@constant.macro"]              = { link = "@constant" },

    -- Modules and Labels
    ["@module"]                      = { fg = c.fg },
    ["@module.builtin"]              = { fg = c.green },
    ["@label"]                       = { fg = c.fg },

    -- Strings
    ["@string"]                      = { fg = c.string },
    ["@string.documentation"]        = { fg = c.comment, italic = true },
    ["@string.regexp"]               = { fg = c.string },
    ["@string.escape"]               = { fg = c.green },
    ["@string.special"]              = { link = "@string" },
    ["@string.special.symbol"]       = { link = "@string" },
    ["@string.special.path"]         = { link = "@string" },
    ["@string.special.url"]          = { fg = c.string, underline = true },

    -- Characters and Booleans
    ["@character"]                   = { link = "@string" },
    ["@character.special"]           = { link = "@string" },
    ["@boolean"]                     = { link = "@constant" },

    -- Numbers
    ["@number"]                      = { link = "@constant" },
    ["@number.float"]                = { link = "@constant" },

    -- Types
    ["@type"]                        = { fg = c.fg },
    ["@type.builtin"]                = { fg = c.fg, italic = true },
    ["@type.definition"]             = { link = "@type" },

    -- Attributes
    ["@attribute"]                   = { fg = c.comment },
    ["@attribute.builtin"]           = { link = "@attribute" },
    ["@property"]                    = { fg = c.fg },

    -- Functions
    ["@function"]                    = { fg = c.fg, bold = true },
    ["@function.builtin"]            = { fg = c.green },
    ["@function.call"]               = { link = "@function" },
    ["@function.macro"]              = { link = "@function" },
    ["@function.method"]             = { link = "@function" },
    ["@function.method.call"]        = { link = "@function" },
    ["@constructor"]                 = { link = "@function" },

    -- Operators and Keywords
    ["@operator"]                    = { fg = c.fg },
    ["@keyword"]                     = { fg = c.green, bold = true },
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
    ["@punctuation.delimiter"]       = { fg = c.fg },
    ["@punctuation.bracket"]         = { fg = c.fg },
    ["@punctuation.special"]         = { fg = c.green },

    -- Comments
    ["@comment"]                     = { fg = c.comment, italic = true },
    ["@comment.documentation"]       = { fg = c.comment, italic = true },
    ["@comment.error"]               = { fg = c.error },
    ["@comment.warning"]             = { fg = c.warning },
    ["@comment.todo"]                = { fg = c.green, bold = true },
    ["@comment.note"]                = { fg = c.fg, bold = true },

    -- Markup
    ["@markup.strong"]               = { bold = true },
    ["@markup.italic"]               = { italic = true },
    ["@markup.strikethrough"]        = { strikethrough = true },
    ["@markup.underline"]            = { underline = true },
    ["@markup.heading"]              = { fg = c.green, bold = true },
    ["@markup.heading.1"]            = { link = "@markup.heading" },
    ["@markup.heading.2"]            = { link = "@markup.heading" },
    ["@markup.heading.3"]            = { link = "@markup.heading" },
    ["@markup.heading.4"]            = { link = "@markup.heading" },
    ["@markup.heading.5"]            = { link = "@markup.heading" },
    ["@markup.heading.6"]            = { link = "@markup.heading" },
    ["@markup.quote"]                = { fg = c.comment, italic = true },
    ["@markup.math"]                 = { fg = c.string },
    ["@markup.link"]                 = { fg = c.fg, underline = true },
    ["@markup.link.label"]           = { link = "@markup.link" },
    ["@markup.link.url"]             = { fg = c.string, underline = true },
    ["@markup.raw"]                  = { fg = c.comment },
    ["@markup.raw.block"]            = { link = "@markup.raw" },
    ["@markup.list"]                 = { fg = c.fg },
    ["@markup.list.checked"]         = { fg = c.green },
    ["@markup.list.unchecked"]       = { fg = c.comment },

    -- Diff
    ["@diff.plus"]                   = { fg = c.green },
    ["@diff.minus"]                  = { fg = c.error },
    ["@diff.delta"]                  = { fg = c.warning },

    -- Tags (HTML/XML/JSX)
    ["@tag"]                         = { fg = c.green },
    ["@tag.builtin"]                 = { link = "@tag" },
    ["@tag.attribute"]               = { fg = c.fg },
    ["@tag.delimiter"]               = { fg = c.fg },

    -- Spell and Conceal
    ["@spell"]                       = {},
    ["@nospell"]                     = { link = "@spell" },
    ["@conceal"]                     = { fg = c.comment },

    -- @lsp.type.* — 23 groups (TS-02)
    -- Link to corresponding Tree-sitter group; override only when LSP needs different styling
    ["@lsp.type.namespace"]          = { link = "@module" },
    ["@lsp.type.type"]               = { link = "@type" },
    ["@lsp.type.class"]              = { link = "@type" },
    ["@lsp.type.enum"]               = { link = "@type" },
    ["@lsp.type.interface"]          = { link = "@type" },
    ["@lsp.type.struct"]             = { link = "@type" },
    ["@lsp.type.typeParameter"]      = { link = "@type" },
    ["@lsp.type.parameter"]          = { link = "@variable.parameter" },
    ["@lsp.type.variable"]           = { link = "@variable" },
    ["@lsp.type.property"]           = { link = "@property" },
    ["@lsp.type.enumMember"]         = { link = "@constant" },
    ["@lsp.type.event"]              = { link = "@variable" },
    ["@lsp.type.function"]           = { link = "@function" },
    ["@lsp.type.method"]             = { link = "@function.method" },
    ["@lsp.type.macro"]              = { link = "@constant.macro" },
    ["@lsp.type.keyword"]            = { link = "@keyword" },
    ["@lsp.type.modifier"]           = { link = "@keyword.modifier" },
    ["@lsp.type.comment"]            = { link = "@comment" },
    ["@lsp.type.string"]             = { link = "@string" },
    ["@lsp.type.number"]             = { link = "@number" },
    ["@lsp.type.regexp"]             = { link = "@string.regexp" },
    ["@lsp.type.operator"]           = { link = "@operator" },
    ["@lsp.type.decorator"]          = { link = "@attribute" },

    -- @lsp.mod.* — 10 groups (TS-03)
    -- Modifiers apply style changes on top of the base type color
    -- NOTE: link + attrs is mutually exclusive — use direct defs when style needed
    ["@lsp.mod.declaration"]         = {},
    ["@lsp.mod.definition"]          = {},
    ["@lsp.mod.readonly"]            = { link = "@constant" },
    ["@lsp.mod.static"]              = { italic = true },
    ["@lsp.mod.deprecated"]          = { strikethrough = true },
    ["@lsp.mod.abstract"]            = { italic = true },
    ["@lsp.mod.async"]               = { italic = true },
    ["@lsp.mod.modification"]        = {},
    ["@lsp.mod.documentation"]       = { link = "@comment.documentation" },
    ["@lsp.mod.defaultLibrary"]      = { link = "@variable.builtin" },
  }
end

return M
