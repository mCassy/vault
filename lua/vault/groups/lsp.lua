local palette = require("vault.palette").colors
local config = require("vault.config")

---Get LSP and diagnostic highlight groups
---@return table<string, vim.api.keyset.highlight>
local function get()
  local p = palette
  local transparent = config.transparent
  local bg = transparent and p.none or p.bg

  return {
    -- LSP references and misc
    LspReferenceText            = { link = "Visual" },
    LspReferenceRead            = { link = "Visual" },
    LspReferenceWrite           = { link = "Visual" },
    LspInlayHint                = { fg = p.comment, italic = true },
    LspCodeLens                 = { fg = p.comment, italic = true },
    LspCodeLensSeparator        = { fg = p.comment },
    LspSignatureActiveParameter = { fg = p.green, bold = true, underline = true },

    -- Diagnostics — base
    DiagnosticError = { fg = p.error },
    DiagnosticWarn  = { fg = p.warning },
    DiagnosticInfo  = { fg = p.info },
    DiagnosticHint  = { fg = p.hint },
    DiagnosticOk    = { fg = p.green },

    -- Diagnostic signs
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn  = { link = "DiagnosticWarn" },
    DiagnosticSignInfo  = { link = "DiagnosticInfo" },
    DiagnosticSignHint  = { link = "DiagnosticHint" },
    DiagnosticSignOk    = { link = "DiagnosticOk" },

    -- Virtual text (italic de-emphasis)
    DiagnosticVirtualTextError = { fg = p.error,   bg = bg, italic = true },
    DiagnosticVirtualTextWarn  = { fg = p.warning, bg = bg, italic = true },
    DiagnosticVirtualTextInfo  = { fg = p.info,    bg = bg, italic = true },
    DiagnosticVirtualTextHint  = { fg = p.hint,    bg = bg, italic = true },
    DiagnosticVirtualTextOk    = { fg = p.green,   bg = bg, italic = true },

    -- Virtual lines (Neovim 0.10+)
    DiagnosticVirtualLinesError = { link = "DiagnosticVirtualTextError" },
    DiagnosticVirtualLinesWarn  = { link = "DiagnosticVirtualTextWarn" },
    DiagnosticVirtualLinesInfo  = { link = "DiagnosticVirtualTextInfo" },
    DiagnosticVirtualLinesHint  = { link = "DiagnosticVirtualTextHint" },
    DiagnosticVirtualLinesOk    = { link = "DiagnosticVirtualTextOk" },

    -- Floating diagnostics
    DiagnosticFloatingError = { link = "DiagnosticError" },
    DiagnosticFloatingWarn  = { link = "DiagnosticWarn" },
    DiagnosticFloatingInfo  = { link = "DiagnosticInfo" },
    DiagnosticFloatingHint  = { link = "DiagnosticHint" },
    DiagnosticFloatingOk    = { link = "DiagnosticOk" },

    -- Undercurl (sp = color, not fg)
    DiagnosticUnderlineError = { undercurl = true, sp = p.error },
    DiagnosticUnderlineWarn  = { undercurl = true, sp = p.warning },
    DiagnosticUnderlineInfo  = { undercurl = true, sp = p.info },
    DiagnosticUnderlineHint  = { undercurl = true, sp = p.hint },
    DiagnosticUnderlineOk    = { undercurl = true, sp = p.green },

    -- Special states
    DiagnosticUnnecessary = { fg = p.comment },
    DiagnosticDeprecated  = { fg = p.comment, strikethrough = true },

    -- LSP semantic tokens (@lsp.type.*)
    ["@lsp.type.namespace"]     = { link = "@module" },
    ["@lsp.type.type"]          = { link = "@type" },
    ["@lsp.type.class"]         = { link = "@type" },
    ["@lsp.type.enum"]          = { link = "@type" },
    ["@lsp.type.interface"]     = { link = "@type" },
    ["@lsp.type.struct"]        = { link = "@type" },
    ["@lsp.type.typeParameter"] = { link = "@type" },
    ["@lsp.type.parameter"]     = { link = "@variable.parameter" },
    ["@lsp.type.variable"]      = { link = "@variable" },
    ["@lsp.type.property"]      = { link = "@property" },
    ["@lsp.type.enumMember"]    = { link = "@constant" },
    ["@lsp.type.event"]         = { link = "@variable" },
    ["@lsp.type.function"]      = { link = "@function" },
    ["@lsp.type.method"]        = { link = "@function.method" },
    ["@lsp.type.macro"]         = { link = "@constant.macro" },
    ["@lsp.type.keyword"]       = { link = "@keyword" },
    ["@lsp.type.modifier"]      = { link = "@keyword.modifier" },
    ["@lsp.type.comment"]       = { link = "@comment" },
    ["@lsp.type.string"]        = { link = "@string" },
    ["@lsp.type.number"]        = { link = "@number" },
    ["@lsp.type.regexp"]        = { link = "@string.regexp" },
    ["@lsp.type.operator"]      = { link = "@operator" },
    ["@lsp.type.decorator"]     = { link = "@attribute" },

    -- LSP semantic modifiers (@lsp.mod.*)
    ["@lsp.mod.declaration"]    = {},
    ["@lsp.mod.definition"]     = {},
    ["@lsp.mod.readonly"]       = { link = "@constant" },
    ["@lsp.mod.static"]         = { italic = true },
    ["@lsp.mod.deprecated"]     = { strikethrough = true },
    ["@lsp.mod.abstract"]       = { italic = true },
    ["@lsp.mod.async"]          = { italic = true },
    ["@lsp.mod.modification"]   = {},
    ["@lsp.mod.documentation"]  = { link = "@comment.documentation" },
    ["@lsp.mod.defaultLibrary"] = { link = "@variable.builtin" },

    -- LSP typemod combinations
    ["@lsp.typemod.function.declaration"]    = { fg = p.fg, bold = true },
    ["@lsp.typemod.function.defaultLibrary"] = { fg = p.green },
    ["@lsp.typemod.method.declaration"]      = { fg = p.fg, bold = true },
    ["@lsp.typemod.variable.readonly"]       = { fg = p.string },
    ["@lsp.typemod.variable.globalScope"]    = { fg = p.fg, bold = true },
    ["@lsp.typemod.variable.constant"]       = { fg = p.string },
    ["@lsp.typemod.parameter.declaration"]   = { link = "@variable.parameter" },
    ["@lsp.typemod.property.readonly"]       = { fg = p.string },
    ["@lsp.typemod.class.declaration"]       = { fg = p.fg, bold = true },
    ["@lsp.typemod.interface.declaration"]   = { fg = p.fg, bold = true },
  }
end

return { get = get }
