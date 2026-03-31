-- vault highlight groups: Telescope integration (~20 groups)
-- Covers: TEL-01 (pane bgs), TEL-02 (borders), TEL-03 (selection),
--         TEL-04 (match highlight), TEL-05 (prompt elements + titles)
local M = {}

function M.get(c)
  return {
    -- Pane backgrounds (TEL-01) — bg differentiation per UI-02/D-02
    -- Two-level hierarchy: prompt = ui_bg (active zone pops), results/preview = bg (recedes)
    TelescopeNormal        = { fg = c.fg,      bg = c.bg },      -- fallback for non-three-pane pickers
    TelescopePromptNormal  = { fg = c.fg,      bg = c.ui_bg },   -- active input zone
    TelescopeResultsNormal = { fg = c.fg,      bg = c.bg },      -- content pane
    TelescopePreviewNormal = { fg = c.fg,      bg = c.bg },      -- preview pane

    -- Borders (TEL-02) — border fg matches pane bg to create flush border effect
    TelescopeBorder        = { fg = c.comment, bg = c.bg },
    TelescopePromptBorder  = { fg = c.comment, bg = c.ui_bg },
    TelescopeResultsBorder = { fg = c.comment, bg = c.bg },
    TelescopePreviewBorder = { fg = c.comment, bg = c.bg },

    -- Titles (TEL-05) — amber-dominant per D-06; secondary titles dim
    TelescopeTitle         = { fg = c.fg,      bold = true },
    TelescopePromptTitle   = { fg = c.fg,      bg = c.ui_bg, bold = true },
    TelescopeResultsTitle  = { fg = c.comment, bg = c.bg },
    TelescopePreviewTitle  = { fg = c.comment, bg = c.bg },

    -- Selection (TEL-03) — explicit attrs; NOT linked to CursorLine per D-04
    TelescopeSelection      = { bg = c.selection },              -- uses existing selection bg (#2a3a00) per D-03
    TelescopeSelectionCaret = { fg = c.green },                  -- Matrix green caret (›) per D-04

    -- Matching (TEL-04) — ONE sanctioned green accent in Telescope UI per D-05
    TelescopeMatching      = { fg = c.green, bold = true },

    -- Prompt elements (TEL-05) — amber per D-06; green NOT used here
    TelescopePromptPrefix  = { fg = c.fg },                      -- › prompt prefix: amber
    TelescopePromptCounter = { fg = c.comment },                 -- entry count: dim amber

    -- Multi-selection
    TelescopeMultiSelection = { bg = c.selection },
    TelescopeMultiIcon      = { fg = c.fg },

    -- Results syntax links — link to existing treesitter groups for free completeness
    -- Cost: near-zero; prevents falling back to Normal for symbol-type results
    TelescopeResultsFunction = { link = "@function" },
    TelescopeResultsMethod   = { link = "@function.method" },
    TelescopeResultsClass    = { link = "@type" },
    TelescopeResultsStruct   = { link = "@type" },
    TelescopeResultsField    = { link = "@variable.member" },
    TelescopeResultsVariable = { link = "@variable" },
    TelescopeResultsConstant = { link = "@constant" },
    TelescopeResultsOperator = { link = "@operator" },
    TelescopeResultsNumber   = { link = "@number" },
    TelescopeResultsComment  = { link = "@comment" },
    TelescopeResultsSpecialComment = { link = "@comment" },
    TelescopeResultsIdentifier     = { link = "@variable" },
    TelescopeResultsLineNr         = { fg = c.comment },
    TelescopeResultsDiffAdd        = { link = "DiffAdd" },
    TelescopeResultsDiffChange     = { link = "DiffChange" },
    TelescopeResultsDiffDelete     = { link = "DiffDelete" },
    TelescopeResultsDiffUntracked  = { fg = c.comment },
    TelescopeResultsDirectory      = { fg = c.fg, bold = true },
  }
end

return M
